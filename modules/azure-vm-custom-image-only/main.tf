resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = var.public_ip_allocation_method
  sku                 = var.public_ip_sku
  sku_tier            = "Regional"
  domain_name_label   = var.public_ip_domain_name_label
}

resource "azurerm_network_interface" "net_inf" {
  name                          = var.network_interface_name
  location                      = var.resource_group_location
  resource_group_name           = var.resource_group_name
  enable_accelerated_networking = "true"

  ip_configuration {
    name                          = var.ip_configuration_name
    subnet_id                     = var.subnet_id
    private_ip_address_version    = "IPv4"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
    primary                       = "true"
  }
}

resource "azurerm_network_interface_security_group_association" "netinf_sg_association" {
  network_interface_id      = azurerm_network_interface.net_inf.id
  network_security_group_id = var.security_group_id
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                = var.virtual_machine_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  size                = var.virtual_machine_size
  admin_username      = var.virtual_machine_admin_username
  admin_password      = var.virtual_machine_admin_password
  timezone            = var.virtual_machine_timezone
  provision_vm_agent  = "true"

  network_interface_ids = [
    azurerm_network_interface.net_inf.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_id = data.azurerm_image.search.id
}
