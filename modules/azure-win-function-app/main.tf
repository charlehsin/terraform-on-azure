resource "azurerm_service_plan" "example" {
  name                = var.app_service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  os_type             = var.app_service_plan_os_type
  sku_name            = var.app_service_plan_sku_name
}

resource "azurerm_windows_function_app" "example" {
  name                = var.function_app_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location

  storage_account_name       = var.storage_account_name
  service_plan_id            = azurerm_service_plan.example.id
  storage_account_access_key = var.storage_account_primary_access_key

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "https://${var.storage_account_name}.blob.core.windows.net/${var.storage_container_name}/${var.storage_blob_name}${var.storage_account_blob_container_sas}",
  }

  site_config {
    application_stack {
      node_version = var.function_app_node_version
    }
  }

  lifecycle {
    ignore_changes = [
      app_settings["WEBSITE_RUN_FROM_PACKAGE"],
    ]
  }
}
