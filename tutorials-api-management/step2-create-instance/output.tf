output "resource_group_name" {
  value = azurerm_resource_group.example.name
}

output "resource_group_id" {
  value = azurerm_resource_group.example.id
}

output "id" {
  value = azurerm_api_management.example.id
}

output "portal_url" {
  value = azurerm_api_management.example.developer_portal_url
}
