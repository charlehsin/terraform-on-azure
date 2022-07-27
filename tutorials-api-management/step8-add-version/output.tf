output "gateway_url" {
  value = data.azurerm_api_management.example.gateway_url
}

output "api_url" {
  value = data.azurerm_api_management.example.management_api_url
}

output "portal_url" {
  value = data.azurerm_api_management.example.portal_url
}

output "developer_portal_url" {
  value = data.azurerm_api_management.example.developer_portal_url
}

output "api_v1_id" {
  value = module.azurerm_api_management_api_v1.id
}

output "api_v2_id" {
  value = module.azurerm_api_management_api_v2.id
}
