provider "azurerm" {
  features {}

  tenant_id = data.vault_generic_secret.tutorials_vault_tenant-id.data["tenant-id"]
}

module "public_load_balancer" {
  source = "../../modules/azure-public-load-balancer"

  resource_group_name         = data.vault_generic_secret.tutorials_vault_rg-name.data["resource-group-name"]
  resource_group_location     = data.vault_generic_secret.tutorials_vault_rg-location.data["resource-group-location"]
  public_ip_name              = var.public_ip["name"]
  public_ip_allocation_method = var.public_ip["allocation_method"]
  public_ip_sku               = var.public_ip["sku"]
  public_ip_domain_name_label = var.public_ip["domain_name_label"]
  load_balancer_name          = var.load_balancer["name"]
  load_balancer_sku           = var.load_balancer["sku"]
  frontend_ip_config_name     = var.frontend_ip_config_name
  backend_address_pool_name   = var.backend_address_pool_name
  lb_applications             = var.lb_applications

  depends_on = []
}
