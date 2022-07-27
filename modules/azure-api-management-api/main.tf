resource "azurerm_api_management_api" "api" {
  name                 = var.azurerm_api_management_api_name
  resource_group_name  = var.resource_group_name
  api_management_name  = var.azurerm_api_management_name
  revision             = var.azurerm_api_management_api_revision
  revision_description = (var.azurerm_api_management_api_revision_description == "") ? null : var.azurerm_api_management_api_revision_description
  version              = (var.azurerm_api_management_api_version == "") ? null : var.azurerm_api_management_api_version
  version_set_id       = (var.azurerm_api_management_api_version_set_id == "") ? null : var.azurerm_api_management_api_version_set_id
  display_name         = (var.azurerm_api_management_api_display_name == "") ? null : var.azurerm_api_management_api_display_name
  path                 = (var.azurerm_api_management_api_path == "") ? null : var.azurerm_api_management_api_path
  protocols            = var.azurerm_api_management_api_protocols
  service_url          = (var.azurerm_api_management_api_service_url == "") ? null : var.azurerm_api_management_api_service_url
  source_api_id        = (var.azurerm_api_management_api_source_api_id == "") ? null : var.azurerm_api_management_api_source_api_id

  dynamic "import" {
    for_each = (var.azurerm_api_management_api_import_required == false) ? toset([]) : toset([1])

    content {
      content_format = var.azurerm_api_management_api_import_content_format
      content_value  = var.azurerm_api_management_api_import_content_value
    }
  }
}