output "id" {
  value = azuread_user.example.object_id
}

output "sam_account_name" {
  value = azuread_user.example.onpremises_sam_account_name
}
