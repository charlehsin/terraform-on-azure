output "id" {
  description = "ID of the API."
  value       = azurerm_api_management_api.api.id
}

output "is_current" {
  description = "Is the API current."
  value       = azurerm_api_management_api.api.is_current
}

output "is_online" {
  description = "Is the API online."
  value       = azurerm_api_management_api.api.is_online
}

output "version" {
  description = "Version of the API."
  value       = azurerm_api_management_api.api.version
}

output "version_set_id" {
  description = "Version set ID of the API."
  value       = azurerm_api_management_api.api.version_set_id
}
