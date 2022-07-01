output "azurerm_api_management_gateway_url" {
  value = data.azurerm_api_management.example.gateway_url
}

output "azurerm_api_management_management_api_url" {
  value = data.azurerm_api_management.example.management_api_url
}

output "azurerm_api_management_portal_url" {
  value = data.azurerm_api_management.example.portal_url
}

output "azurerm_api_management_developer_portal_url" {
  value = data.azurerm_api_management.example.developer_portal_url
}

output "azurerm_api_management_api_id" {
  value = azurerm_api_management_api.example.id
}
