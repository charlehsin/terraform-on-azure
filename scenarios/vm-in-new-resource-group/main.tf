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

module "virtual_machine" {
  source = "../../modules/azure-vm"

  resource_group_name              = var.resource_group_name
  resource_group_location          = var.resource_group_location
  public_ip_name                   = var.public_ip["name"]
  public_ip_allocation_method      = var.public_ip["allocation_method"]
  public_ip_sku                    = var.public_ip["sku"]
  public_ip_domain_name_label      = var.public_ip["domain_name_label"]
  network_interface_name           = var.network_interface["name"]
  ip_configuration_name            = var.network_interface["ip_configuration_name"]
  subnet_id                        = module.vnet_subnet.subnet_id
  security_group_id                = module.security_group.security_group_id
  virtual_machine_name             = var.virtual_machine_name
  virtual_machine_size             = var.virtual_machine_size
  virtual_machine_admin_username   = var.virtual_machine_admin_username
  virtual_machine_admin_password   = var.virtual_machine_admin_password
  virtual_machine_timezone         = var.virtual_machine_timezone
  virtual_machine_custom_data_path = "${path.module}/winrm.ps1"
  virtual_machine_first_cmd_path   = "${path.module}/firstlogincommand.xml"
  source_image_sku                 = var.source_image_sku
  upload_source                    = "${path.module}/to_upload/"
  upload_destination               = var.file_upload_target
  remote_commands                  = var.remote_commands

  depends_on = [module.resource_group, module.vnet_subnet, module.security_group]
}
