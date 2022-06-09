provider "azurerm" {
  features {}

  tenant_id = var.tenant_id
}

resource "azurerm_api_management_product" "example" {
  product_id            = var.azurerm_api_management_product_product_id
  api_management_name   = data.azurerm_api_management.example.name
  resource_group_name   = var.resource_group_name
  display_name          = var.azurerm_api_management_product_display_name
  subscription_required = var.azurerm_api_management_product_subscription_required
  approval_required     = var.azurerm_api_management_product_approval_required
  published             = var.azurerm_api_management_product_published
}

resource "azurerm_api_management_product_api" "example" {
  api_name            = data.azurerm_api_management_api.example.name
  product_id          = azurerm_api_management_product.example.product_id
  api_management_name = data.azurerm_api_management.example.name
  resource_group_name = var.resource_group_name
}
