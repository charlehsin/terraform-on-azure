provider "azurerm" {
  features {}

  tenant_id = var.tenant_id
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_storage_account" "example" {
  name                            = var.storage_account_name
  resource_group_name             = azurerm_resource_group.example.name
  location                        = var.resource_group_location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  allow_nested_items_to_be_public = false
}

module "storage_blob" {
  source = "../../modules/azure-storage-blob"

  storage_account_name   = azurerm_storage_account.example.name
  storage_container_name = var.storage_container_name
  storage_blob_name      = "${filesha256(data.archive_file.example.output_path)}.zip"
  storage_blob_source    = local.function_zip_name
}

module "win_function_app" {
  source = "../../modules/azure-win-function-app"

  resource_group_name                = azurerm_resource_group.example.name
  resource_group_location            = var.resource_group_location
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
