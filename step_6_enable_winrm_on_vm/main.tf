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

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location

  tags = {
    Environment = var.resource_group_tag_environment
    Team        = var.resource_group_tag_team
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  address_space       = var.virtual_network_address_space
  location            = var.resource_group_location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_name_address_space
}

resource "azurerm_network_security_group" "sg" {
  name                = var.security_group_name
  location            = var.resource_group_location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_rule" "sg_rule_rdp" {
  name                        = var.security_group_inbound_rules_rdp["name"]
  priority                    = var.security_group_inbound_rules_rdp["priority"]
  direction                   = "Inbound"
  access                      = var.security_group_inbound_rules_rdp["access"]
  protocol                    = var.security_group_inbound_rules_rdp["protocol"]
  source_port_range           = var.security_group_inbound_rules_rdp["source_port_range"]
  destination_port_range      = var.security_group_inbound_rules_rdp["destination_port_range"]
  source_address_prefix       = "${chomp(data.http.myip.body)}/32"
  destination_address_prefix  = var.security_group_inbound_rules_rdp["destination_address_prefix"]
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.sg.name
}

resource "azurerm_network_security_rule" "sg_rule_ssh" {
  name                        = var.security_group_inbound_rules_ssh["name"]
  priority                    = var.security_group_inbound_rules_ssh["priority"]
  direction                   = "Inbound"
  access                      = var.security_group_inbound_rules_ssh["access"]
  protocol                    = var.security_group_inbound_rules_ssh["protocol"]
  source_port_range           = var.security_group_inbound_rules_ssh["source_port_range"]
  destination_port_range      = var.security_group_inbound_rules_ssh["destination_port_range"]
  source_address_prefix       = "${chomp(data.http.myip.body)}/32"
  destination_address_prefix  = var.security_group_inbound_rules_winrm["destination_address_prefix"]
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.sg.name
}

resource "azurerm_network_security_rule" "sg_rule_http" {
  name                        = var.security_group_inbound_rules_http["name"]
  priority                    = var.security_group_inbound_rules_http["priority"]
  direction                   = "Inbound"
  access                      = var.security_group_inbound_rules_http["access"]
  protocol                    = var.security_group_inbound_rules_http["protocol"]
  source_port_range           = var.security_group_inbound_rules_http["source_port_range"]
  destination_port_range      = var.security_group_inbound_rules_http["destination_port_range"]
  source_address_prefix       = var.security_group_inbound_rules_http["source_address_prefix"]
  destination_address_prefix  = var.security_group_inbound_rules_http["destination_address_prefix"]
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.sg.name
}

resource "azurerm_network_security_rule" "sg_rule_winrm" {
  name                        = var.security_group_inbound_rules_winrm["name"]
  priority                    = var.security_group_inbound_rules_winrm["priority"]
  direction                   = "Inbound"
  access                      = var.security_group_inbound_rules_winrm["access"]
  protocol                    = var.security_group_inbound_rules_winrm["protocol"]
  source_port_range           = var.security_group_inbound_rules_winrm["source_port_range"]
  destination_port_range      = var.security_group_inbound_rules_winrm["destination_port_range"]
  source_address_prefix       = "${chomp(data.http.myip.body)}/32"
  destination_address_prefix  = var.security_group_inbound_rules_winrm["destination_address_prefix"]
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.sg.name
}

resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip["name"]
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.resource_group_location
  allocation_method   = var.public_ip["allocation_method"]
  sku                 = var.public_ip["sku"]
  sku_tier            = var.public_ip["sku_tier"]
  domain_name_label   = var.public_ip["domain_name_label"]
}

resource "azurerm_network_interface" "net_inf" {
  name                          = var.network_interface["name"]
  location                      = var.resource_group_location
  resource_group_name           = azurerm_resource_group.rg.name
  enable_accelerated_networking = var.network_interface["enable_accelerated_networking"]

  ip_configuration {
    name                          = var.network_interface["ip_configuration_name"]
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_version    = var.network_interface["ip_configuration_private_ip_address_version"]
    private_ip_address_allocation = var.network_interface["ip_configuration_private_ip_address_allocation"]
    public_ip_address_id          = azurerm_public_ip.public_ip.id
    primary                       = var.network_interface["ip_configuration_primary"]
  }
}

resource "azurerm_network_interface_security_group_association" "netinf_sg_association" {
  network_interface_id      = azurerm_network_interface.net_inf.id
  network_security_group_id = azurerm_network_security_group.sg.id
}

resource "azurerm_windows_virtual_machine" "terramform_vm" {
  name                = var.virtual_machine["name"]
  resource_group_name = azurerm_resource_group.rg.name
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
  provisioner "remote-exec" {
    connection {
      host     = azurerm_public_ip.public_ip.ip_address
      type     = "winrm"
      port     = 5985
      https    = false
      timeout  = "5m"
      user     = var.virtual_machine["admin_username"]
      password = var.virtual_machine["admin_password"]
    }
    inline = [
      "powershell.exe -ExecutionPolicy Unrestricted -Command {Install-WindowsFeature -name Web-Server -IncludeManagementTools}",
    ]
  }
}
