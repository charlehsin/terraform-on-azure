# Get the existing resource group.
data "azurerm_resource_group" "example" {
  name = var.resource_group_name
}

# Get the existing API Management instance.
data "azurerm_api_management" "example" {
  name                = var.azurerm_api_management_name
  resource_group_name = var.resource_group_name
}

# Get the zipped file for the target codes folder.
data "archive_file" "example" {
  type        = "zip"
  source_dir  = local.function_source
  output_path = local.function_zip_name
}

# Get the storage blob info.
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

# Get access key from the Functions App to be used in API Management to forward request to Functions App.
data "azurerm_function_app_host_keys" "example" {
  name                = module.win_function_app.function_app_name
  resource_group_name = data.azurerm_resource_group.example.name

  depends_on = [module.win_function_app]
}
