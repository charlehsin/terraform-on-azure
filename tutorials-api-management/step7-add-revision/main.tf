provider "azurerm" {
  features {}

  tenant_id = var.tenant_id
}

resource "azurerm_api_management_api" "example" {
  name                = var.azurerm_api_management_api_name
  resource_group_name = data.azurerm_resource_group.example.name
  api_management_name = data.azurerm_api_management.example.name
  revision            = var.azurerm_api_management_api_revision
  display_name        = var.azurerm_api_management_api_display_name
  path                = var.azurerm_api_management_api_path
  protocols           = var.azurerm_api_management_api_protocols
  service_url         = var.azurerm_api_management_api_service_url

  import {
    content_format = var.azurerm_api_management_api_import_content_format
    content_value  = var.azurerm_api_management_api_import_content_value
  }
}

resource "azurerm_api_management_api" "revision" {
  name                 = var.azurerm_api_management_api_name
  resource_group_name  = data.azurerm_resource_group.example.name
  api_management_name  = data.azurerm_api_management.example.name
  path                 = var.azurerm_api_management_api_path
  service_url          = var.azurerm_api_management_api_service_url
  source_api_id        = "${azurerm_api_management_api.example.id};rev=1"
  revision             = var.azurerm_api_management_api_2_revision
  revision_description = var.azurerm_api_management_api_2_revision_description
}
