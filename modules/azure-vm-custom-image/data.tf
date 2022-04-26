data "azurerm_image" "search" {
  name                = var.source_custom_image_name
  resource_group_name = var.source_custom_image_resource_group
}
