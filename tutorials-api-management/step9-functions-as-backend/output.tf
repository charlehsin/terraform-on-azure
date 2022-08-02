output "service_plan_id" {
  value = module.win_function_app.application_service_plan_id
}

output "service_plan_kind" {
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

output "api_id" {
  value = module.azurerm_api_management_api.id
}
