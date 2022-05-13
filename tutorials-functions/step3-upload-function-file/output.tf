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
  value = module.win_function_app.application_service_plan_id
}

output "application_service_plan_kind" {
  value = module.win_function_app.application_service_plan_kind
}

output "function_app_id" {
  value = module.win_function_app.function_app_id
}

output "function_app_kind" {
  value = module.win_function_app.function_app_kind
}

output "function_app_default_hostname" {
  value = module.win_function_app.function_app_default_hostname
}
