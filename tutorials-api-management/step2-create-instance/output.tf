output "resource_group_name" {
  value = azurerm_resource_group.example.name
}

output "resource_group_id" {
  value = azurerm_resource_group.example.id
}

output "azurerm_api_management_id" {
  value = azurerm_api_management.example.id
}

output "azurerm_api_management_developer_portal_url" {
  value = azurerm_api_management.example.developer_portal_url
}
