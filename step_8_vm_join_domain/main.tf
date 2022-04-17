terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.2.0"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}

  tenant_id = var.tenant_id
}

resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip["name"]
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = var.public_ip["allocation_method"]
  sku                 = var.public_ip["sku"]
  sku_tier            = var.public_ip["sku_tier"]
  domain_name_label   = var.public_ip["domain_name_label"]
}

resource "azurerm_network_interface" "net_inf" {
  name                          = var.network_interface["name"]
  location                      = var.resource_group_location
  resource_group_name           = var.resource_group_name
  enable_accelerated_networking = var.network_interface["enable_accelerated_networking"]

  ip_configuration {
    name                          = var.network_interface["ip_configuration_name"]
    subnet_id                     = var.network_interface["ip_configuration_subnet_id"]
    private_ip_address_version    = var.network_interface["ip_configuration_private_ip_address_version"]
    private_ip_address_allocation = var.network_interface["ip_configuration_private_ip_address_allocation"]
    public_ip_address_id          = azurerm_public_ip.public_ip.id
    primary                       = var.network_interface["ip_configuration_primary"]
  }
}

resource "azurerm_network_interface_security_group_association" "netinf_sg_association" {
  network_interface_id      = azurerm_network_interface.net_inf.id
  network_security_group_id = var.network_interface["security_group_id"]
}

resource "azurerm_windows_virtual_machine" "terramform_vm" {
  name                = var.virtual_machine["name"]
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  size                = var.virtual_machine["size"]
  admin_username      = var.virtual_machine["admin_username"]
  admin_password      = var.virtual_machine["admin_password"]
  network_interface_ids = [
    azurerm_network_interface.net_inf.id,
  ]
  timezone = var.virtual_machine["timezone"]

  os_disk {
    caching              = var.virtual_machine["os_disk_caching"]
    storage_account_type = var.virtual_machine["os_disk_storage_account_type"]
  }

  source_image_reference {
    publisher = var.virtual_machine["image_publisher"]
    offer     = var.virtual_machine["image_offer"]
    sku       = var.virtual_machine["image_sku"]
    version   = var.virtual_machine["image_version"]
  }

  custom_data        = filebase64("${path.module}/winrm.ps1")
  provision_vm_agent = "true"
  winrm_listener {
    protocol = "Http"
  }
  additional_unattend_content {
    setting = "AutoLogon"
    content = "<AutoLogon><Password><Value>${var.virtual_machine["admin_password"]}</Value></Password><Enabled>true</Enabled><LogonCount>1</LogonCount><Username>${var.virtual_machine["admin_username"]}</Username></AutoLogon>"
  }
  additional_unattend_content {
    setting = "FirstLogonCommands"
    content = file("${path.module}/firstlogincommand.xml")
  }

  # Upload the content of to_upload folder to the target's C:/upload_files folder.
  provisioner "file" {
    connection {
      host     = azurerm_public_ip.public_ip.ip_address
      type     = "winrm"
      port     = var.winrm["port"]
      https    = var.winrm["https"]
      timeout  = var.winrm["timeout"]
      user     = var.virtual_machine["admin_username"]
      password = var.virtual_machine["admin_password"]
    }
    source      = "${path.module}/to_upload/"
    destination = "C:/upload_files"
  }

  # Run the uploaded script.
  provisioner "remote-exec" {
    connection {
      host     = azurerm_public_ip.public_ip.ip_address
      type     = "winrm"
      port     = var.winrm["port"]
      https    = var.winrm["https"]
      timeout  = var.winrm["timeout"]
      user     = var.virtual_machine["admin_username"]
      password = var.virtual_machine["admin_password"]
    }
    inline = [
      "powershell.exe -sta -ExecutionPolicy Unrestricted -file C:/upload_files/setup/setup_iis.ps1",
      "powershell.exe -sta -ExecutionPolicy Unrestricted -file C:/upload_files/setup/setup_netadaptor.ps1",
      "powershell.exe -sta -ExecutionPolicy Unrestricted -file C:/upload_files/setup/setup_join_domain.ps1",
      "powershell.exe -sta -ExecutionPolicy Unrestricted -Command {Remove-Item C:/upload_files/setup/setup_join_domain.ps1 -Force}",
    ]
  }
}
