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

resource "azurerm_api_management_api" "v1" {
  name                = "${var.azurerm_api_management_api_name}-v1"
  resource_group_name = data.azurerm_resource_group.example.name
  api_management_name = data.azurerm_api_management.example.name
  display_name        = "${var.azurerm_api_management_api_display_name}-v1"
  path                = var.azurerm_api_management_api_path
  protocols           = var.azurerm_api_management_api_protocols
  service_url         = var.azurerm_api_management_api_service_url
  revision            = var.azurerm_api_management_api_revision
  version             = "v1"
  version_set_id      = azurerm_api_management_api_version_set.example.id

  import {
    content_format = var.azurerm_api_management_api_import_content_format
    content_value  = var.azurerm_api_management_api_import_content_value
  }
}

resource "azurerm_api_management_api" "v2" {
  name                = "${var.azurerm_api_management_api_name}-v2"
  resource_group_name = data.azurerm_resource_group.example.name
  api_management_name = data.azurerm_api_management.example.name
  display_name        = "${var.azurerm_api_management_api_display_name}-v2"
  path                = var.azurerm_api_management_api_path
  protocols           = var.azurerm_api_management_api_protocols
  service_url         = var.azurerm_api_management_api_service_url
  revision            = var.azurerm_api_management_api_revision
  version             = "v2"
  version_set_id      = azurerm_api_management_api_version_set.example.id
  //source_api_id      = azurerm_api_management_api.v1.id

  import {
    content_format = var.azurerm_api_management_api_import_content_format
    content_value  = var.azurerm_api_management_api_import_content_value
  }

  depends_on = [
    azurerm_api_management_api.v1
  ]
}
