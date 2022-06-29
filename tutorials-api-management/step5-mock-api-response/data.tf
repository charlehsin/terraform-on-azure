data "azurerm_resource_group" "example" {
  name = var.resource_group_name
}

data "azurerm_api_management" "example" {
  name                = var.azurerm_api_management_name
  resource_group_name = var.resource_group_name
}
