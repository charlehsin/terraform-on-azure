resource "azurerm_storage_container" "example" {
  name                  = var.storage_container_name
  storage_account_name  = var.storage_account_name
  container_access_type = var.storage_container_access_type
}

resource "azurerm_storage_blob" "example" {
  name                   = var.storage_blob_name
  storage_account_name   = var.storage_account_name
  storage_container_name = azurerm_storage_container.example.name
  type                   = "Block"
  source                 = var.storage_blob_source
}
