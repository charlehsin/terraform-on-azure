provider "azurerm" {
  features {}

  tenant_id = var.tenant_id
}

resource "azuread_user" "example" {
  user_principal_name = var.user_principal_name
  display_name        = var.display_name
  mail                = var.mail
  mail_nickname       = var.mail_nickname
  password            = var.password
}
