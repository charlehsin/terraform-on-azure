provider "azuread" {
  tenant_id = var.tenant_id
}

module "azuread_application" {
  source = "../../modules/azure-add-app-registration"

  display_name                          = var.display_name
  owners                                = [data.azuread_client_config.current.object_id]
  sign_in_audience                      = var.sign_in_audience
  client_secrete_display_name           = var.client_secrete_display_name
  client_secrete_end_date_relative      = var.client_secrete_end_date_relative
  single_page_application_required      = true
  single_page_application_redirect_uris = var.single_page_application_redirect_uris
}
