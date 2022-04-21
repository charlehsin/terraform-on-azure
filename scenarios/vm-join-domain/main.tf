provider "azurerm" {
  features {}

  tenant_id = var.tenant_id
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
  subnet_id                        = var.subnet_id
  security_group_id                = var.security_group_id
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

  depends_on = []
}
resource "azurerm_network_interface_backend_address_pool_association" "example" {
  network_interface_id    = module.virtual_machine.network_interface_id
  ip_configuration_name   = var.network_interface["ip_configuration_name"]
  backend_address_pool_id = data.azurerm_lb_backend_address_pool.example.id
}
