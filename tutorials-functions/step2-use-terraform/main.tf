provider "azurerm" {
  features {}

  tenant_id = var.tenant_id
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_storage_account" "example" {
  name                            = var.storage_account_name
  resource_group_name             = azurerm_resource_group.example.name
  location                        = var.resource_group_location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  allow_nested_items_to_be_public = false
}

resource "azurerm_service_plan" "example" {
  name                = var.app_service_plan_name
  resource_group_name = azurerm_resource_group.example.name
  location            = var.resource_group_location
  os_type             = "Windows"
  sku_name            = "Y1"
}

resource "azurerm_windows_function_app" "example" {
  name                = var.function_app_name
  resource_group_name = azurerm_resource_group.example.name
  location            = var.resource_group_location

  storage_account_name       = azurerm_storage_account.example.name
  service_plan_id            = azurerm_service_plan.example.id
  storage_account_access_key = azurerm_storage_account.example.primary_access_key

  site_config {
    application_stack {
      node_version = "~14"
    }
  }

  lifecycle {
    ignore_changes = [
      app_settings["WEBSITE_RUN_FROM_PACKAGE"],
    ]
  }
}
