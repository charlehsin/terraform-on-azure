provider "azurerm" {
  features {}

  tenant_id = var.tenant_id
}

module "resource_group" {
  source = "../../modules/azure-resource-group"

  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
}

module "vnet_subnet" {
  source = "../../modules/azure-vnet-subnet"

  resource_group_name           = var.resource_group_name
  resource_group_location       = var.resource_group_location
  virtual_network_name          = var.virtual_network_name
  virtual_network_address_space = var.virtual_network_address_space
  subnet_name                   = var.subnet_name
  subnet_name_address_space     = var.subnet_name_address_space

  depends_on = [module.resource_group]
}

module "security_group" {
  source = "../../modules/azure-security-group"

  resource_group_name                = var.resource_group_name
  resource_group_location            = var.resource_group_location
  security_group_name                = var.security_group_name
  inbound_rule_source_address_prefix = "${chomp(data.http.myip.body)}/32"

  depends_on = [module.resource_group]
}

module "public_load_balancer" {
  source = "../../modules/azure-public-load-balancer"

  resource_group_name         = var.resource_group_name
  resource_group_location     = var.resource_group_location
  public_ip_name              = var.public_ip_lb["name"]
  public_ip_allocation_method = var.public_ip_lb["allocation_method"]
  public_ip_sku               = var.public_ip_lb["sku"]
  public_ip_domain_name_label = var.public_ip_lb["domain_name_label"]
  load_balancer_name          = var.load_balancer["name"]
  load_balancer_sku           = var.load_balancer["sku"]
  frontend_ip_config_name     = var.frontend_ip_config_name
  backend_address_pool_name   = var.backend_address_pool_name
  lb_applications             = var.lb_applications

  depends_on = [module.resource_group]
}
