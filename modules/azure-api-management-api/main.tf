resource "azurerm_api_management_api" "api" {
  name                = var.azurerm_api_management_api_name
  resource_group_name = var.resource_group_name
  api_management_name = var.azurerm_api_management_name
  revision            = var.azurerm_api_management_api_revision
  display_name        = var.azurerm_api_management_api_display_name
  path                = (var.azurerm_api_management_api_path == "") ? null : var.azurerm_api_management_api_path
  protocols           = var.azurerm_api_management_api_protocols
  service_url         = (var.azurerm_api_management_api_service_url == "") ? null : var.azurerm_api_management_api_service_url

  dynamic "import" {
    for_each = (var.azurerm_api_management_api_import_required == false) ? toset([]) : toset([1])

    content {
      content_format = var.azurerm_api_management_api_import_content_format
      content_value  = var.azurerm_api_management_api_import_content_value
    }
  }
}