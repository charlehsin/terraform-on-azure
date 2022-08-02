provider "azurerm" {
  features {}

  tenant_id = var.tenant_id
}

# Create the storage account to upload the Functions App codes.
resource "azurerm_storage_account" "example" {
  name                            = var.storage_account_name
  resource_group_name             = data.azurerm_resource_group.example.name
  location                        = data.azurerm_resource_group.example.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  allow_nested_items_to_be_public = false
}

# Create the storage blob in the storage account to upload the Functions App codes.
module "storage_blob" {
  source = "../../modules/azure-storage-blob"

  storage_account_name   = azurerm_storage_account.example.name
  storage_container_name = var.storage_container_name
  storage_blob_name      = "${filesha256(data.archive_file.example.output_path)}.zip"
  storage_blob_source    = local.function_zip_name
}

# Creat Functions App
module "win_function_app" {
  source = "../../modules/azure-win-function-app"

  resource_group_name                = data.azurerm_resource_group.example.name
  resource_group_location            = data.azurerm_resource_group.example.location
  app_service_plan_name              = var.app_service_plan_name
  app_service_plan_os_type           = "Windows"
  app_service_plan_sku_name          = "Y1"
  function_app_name                  = var.function_app_name
  storage_account_name               = azurerm_storage_account.example.name
  storage_account_primary_access_key = azurerm_storage_account.example.primary_access_key
  storage_container_name             = module.storage_blob.storage_container_name
  storage_blob_name                  = module.storage_blob.storage_blob_name
  storage_account_blob_container_sas = data.azurerm_storage_account_blob_container_sas.example.sas
}

# Create API
module "azurerm_api_management_api" {
  source = "../../modules/azure-api-management-api"

  resource_group_name                              = data.azurerm_resource_group.example.name
  azurerm_api_management_name                      = data.azurerm_api_management.example.name
  azurerm_api_management_api_name                  = var.azurerm_api_management_api_name
  azurerm_api_management_api_revision              = var.azurerm_api_management_api_revision
  azurerm_api_management_api_display_name          = var.azurerm_api_management_api_display_name
  azurerm_api_management_api_path                  = var.azurerm_api_management_api_path
  azurerm_api_management_api_protocols             = var.azurerm_api_management_api_protocols
  azurerm_api_management_api_import_required       = true
  azurerm_api_management_api_import_content_format = var.azurerm_api_management_api_import_content_format
  azurerm_api_management_api_import_content_value  = file(var.azurerm_api_management_api_import_content_value)
}

# Create a named value in API Management to store the access key for Functions App.
resource "azurerm_api_management_named_value" "example" {
  resource_group_name = data.azurerm_resource_group.example.name
  api_management_name = data.azurerm_api_management.example.name
  name                = var.azurerm_api_management_named_value_name
  display_name        = var.azurerm_api_management_named_value_display_name
  value               = data.azurerm_function_app_host_keys.example.default_function_key
  secret              = true
}

# Create an API backend to insert the Functions App access key into the request header.
# Check https://docs.microsoft.com/en-us/azure/api-management/api-management-howto-properties?tabs=azure-portal#use-a-named-value to see how to use the named value.
resource "azurerm_api_management_backend" "example" {
  resource_group_name = data.azurerm_resource_group.example.name
  api_management_name = data.azurerm_api_management.example.name
  name                = var.azurerm_api_management_backend_name
  protocol            = "http"
  url                 = "https://${module.win_function_app.function_app_default_hostname}/api/"

  credentials {
    header = {
      x-functions-key = "{{${var.azurerm_api_management_named_value_name}}}"
    }
  }

  depends_on = [azurerm_api_management_named_value.example]
}

# Create an API policy to set the target backend to the target API.
resource "azurerm_api_management_api_policy" "example" {
  resource_group_name = data.azurerm_resource_group.example.name
  api_management_name = data.azurerm_api_management.example.name
  api_name            = module.azurerm_api_management_api.name

  xml_content = <<XML
    <policies>
        <inbound>
            <base />
            <set-backend-service backend-id="${azurerm_api_management_backend.example.name}" />
        </inbound>
    </policies>
  XML
}
