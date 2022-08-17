output "application_id" {
  value = azuread_application.example.application_id
}

output "object_id" {
  value = azuread_application.example.object_id
}

output "client_secret_key_id" {
  value = azuread_application_password.example.key_id
}

output "client_secret_value" {
  value     = azuread_application_password.example.value
  sensitive = true
}
