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

output "function_app_default_hostname" {
  value = azurerm_windows_function_app.example.default_hostname
}
