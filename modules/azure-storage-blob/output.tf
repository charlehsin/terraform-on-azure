output "storage_container_name" {
  value = azurerm_storage_container.example.name
}

output "storage_container_id" {
  value = azurerm_storage_container.example.id
}

output "storage_blob_name" {
  value = azurerm_storage_blob.example.name
}

output "storage_blob_id" {
  value = azurerm_storage_blob.example.id
}

output "storage_blob_url" {
  value = azurerm_storage_blob.example.url
}
