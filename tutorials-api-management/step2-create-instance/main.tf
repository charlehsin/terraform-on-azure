provider "azurerm" {
  features {}

  tenant_id = var.tenant_id
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_api_management" "example" {
  name                = var.azurerm_api_management_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  publisher_name      = var.azurerm_api_management_publisher_name
  publisher_email     = var.azurerm_api_management_publisher_email
  sku_name            = var.azurerm_api_management_sku_name
}
