provider "azurerm" {
  features {}

  tenant_id = var.tenant_id
}

resource "azurerm_api_management_api_version_set" "example" {
  name                = var.azurerm_api_management_api_version_set_name
  resource_group_name = data.azurerm_resource_group.example.name
  api_management_name = data.azurerm_api_management.example.name
  display_name        = var.azurerm_api_management_api_version_set_display_name
  versioning_scheme   = var.azurerm_api_management_api_version_set_versioning_scheme
}

module "azurerm_api_management_api_v1" {
  source = "../../modules/azure-api-management-api"

  resource_group_name                              = data.azurerm_resource_group.example.name
  azurerm_api_management_name                      = data.azurerm_api_management.example.name
  azurerm_api_management_api_name                  = "${var.azurerm_api_management_api_name}-v1"
  azurerm_api_management_api_revision              = var.azurerm_api_management_api_revision
  azurerm_api_management_api_display_name          = "${var.azurerm_api_management_api_display_name}-v1"
  azurerm_api_management_api_path                  = var.azurerm_api_management_api_path
  azurerm_api_management_api_protocols             = var.azurerm_api_management_api_protocols
  azurerm_api_management_api_service_url           = var.azurerm_api_management_api_service_url
  azurerm_api_management_api_version               = "v1"
  azurerm_api_management_api_version_set_id        = azurerm_api_management_api_version_set.example.id
  azurerm_api_management_api_import_required       = true
  azurerm_api_management_api_import_content_format = var.azurerm_api_management_api_import_content_format
  azurerm_api_management_api_import_content_value  = var.azurerm_api_management_api_import_content_value
}

module "azurerm_api_management_api_v2" {
  source = "../../modules/azure-api-management-api"

  resource_group_name                              = data.azurerm_resource_group.example.name
  azurerm_api_management_name                      = data.azurerm_api_management.example.name
  azurerm_api_management_api_name                  = "${var.azurerm_api_management_api_name}-v2"
  azurerm_api_management_api_revision              = var.azurerm_api_management_api_revision
  azurerm_api_management_api_display_name          = "${var.azurerm_api_management_api_display_name}-v2"
  azurerm_api_management_api_path                  = var.azurerm_api_management_api_path
  azurerm_api_management_api_protocols             = var.azurerm_api_management_api_protocols
  azurerm_api_management_api_service_url           = var.azurerm_api_management_api_service_url
  azurerm_api_management_api_version               = "v2"
  azurerm_api_management_api_version_set_id        = azurerm_api_management_api_version_set.example.id
  azurerm_api_management_api_import_required       = true
  azurerm_api_management_api_import_content_format = var.azurerm_api_management_api_import_content_format
  azurerm_api_management_api_import_content_value  = var.azurerm_api_management_api_import_content_value

  depends_on = [
    module.azurerm_api_management_api_v1
  ]
}
