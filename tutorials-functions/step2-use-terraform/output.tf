output "resource_group_name" {
  value = azurerm_resource_group.example.name
}

output "resource_group_id" {
  value = azurerm_resource_group.example.id
}

output "storage_account_id" {
  value = azurerm_storage_account.example.id
}

output "application_service_plan_id" {
  value = azurerm_service_plan.example.id
}

output "application_service_plan_kind" {
  value = azurerm_service_plan.example.kind
}

output "function_app_id" {
  value = azurerm_windows_function_app.example.id
}

output "function_app_kind" {
  value = azurerm_windows_function_app.example.kind
}
