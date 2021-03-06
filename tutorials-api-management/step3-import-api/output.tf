output "gateway_url" {
  value = data.azurerm_api_management.example.gateway_url
}

output "pi_url" {
  value = data.azurerm_api_management.example.management_api_url
}

output "portal_url" {
  value = data.azurerm_api_management.example.portal_url
}

output "portal_url" {
  value = data.azurerm_api_management.example.developer_portal_url
}

output "api_id" {
  value = module.azurerm_api_management_api.id
}
