output "application_id" {
  value = module.azuread_application.application_id
}

output "object_id" {
  value = module.azuread_application.object_id
}

output "client_secret_key_id" {
  value = module.azuread_application.client_secret_key_id
}

output "client_secret_value" {
  value     = module.azuread_application.client_secret_value
  sensitive = true
}
