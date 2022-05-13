data "archive_file" "example" {
  type        = "zip"
  source_dir  = local.function_source
  output_path = local.function_zip_name
}

data "azurerm_storage_account_blob_container_sas" "example" {
  connection_string = azurerm_storage_account.example.primary_connection_string
  container_name    = module.storage_blob.storage_container_name

  start  = timestamp()
  expiry = timeadd(timestamp(), "2h")

  permissions {
    read   = true
    add    = false
    create = false
    write  = false
    delete = false
    list   = false
  }
}
