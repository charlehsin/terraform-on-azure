provider "azuread" {
  tenant_id = var.tenant_id
}

module "azuread_application" {
  source = "../../modules/azure-add-app-registration"

  display_name                      = var.display_name
  owners                            = [data.azuread_client_config.current.object_id]
  sign_in_audience                  = var.sign_in_audience
  client_secrete_display_name       = var.client_secrete_display_name
  client_secrete_end_date_relative  = var.client_secrete_end_date_relative
  web_required                      = true
  web_homepage_url                  = var.web_homepage_url
  web_logout_url                    = var.web_logout_url
  web_redirect_uris                 = var.web_redirect_uris
  web_access_token_issuance_enabled = var.web_access_token_issuance_enabled
  web_id_token_issuance_enabled     = var.web_id_token_issuance_enabled
}
