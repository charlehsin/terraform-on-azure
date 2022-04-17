terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
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

resource "azurerm_network_security_rule" "sg_rule1" {
  name                        = var.security_group_inbound_rules_1["name"]
  priority                    = var.security_group_inbound_rules_1["priority"]
  direction                   = "Inbound"
  access                      = var.security_group_inbound_rules_1["access"]
  protocol                    = var.security_group_inbound_rules_1["protocol"]
  source_port_range           = var.security_group_inbound_rules_1["source_port_range"]
  destination_port_range      = var.security_group_inbound_rules_1["destination_port_range"]
  source_address_prefix       = var.security_group_inbound_rules_1["source_address_prefix"]
  destination_address_prefix  = var.security_group_inbound_rules_1["destination_address_prefix"]
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.sg.name
}

resource "azurerm_network_security_rule" "sg_rule2" {
  name                        = var.security_group_inbound_rules_2["name"]
  priority                    = var.security_group_inbound_rules_2["priority"]
  direction                   = "Inbound"
  access                      = var.security_group_inbound_rules_2["access"]
  protocol                    = var.security_group_inbound_rules_2["protocol"]
  source_port_range           = var.security_group_inbound_rules_2["source_port_range"]
  destination_port_range      = var.security_group_inbound_rules_2["destination_port_range"]
  source_address_prefix       = var.security_group_inbound_rules_2["source_address_prefix"]
  destination_address_prefix  = var.security_group_inbound_rules_2["destination_address_prefix"]
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.sg.name
}

resource "azurerm_network_security_rule" "sg_rule3" {
  name                        = var.security_group_inbound_rules_3["name"]
  priority                    = var.security_group_inbound_rules_3["priority"]
  direction                   = "Inbound"
  access                      = var.security_group_inbound_rules_3["access"]
  protocol                    = var.security_group_inbound_rules_3["protocol"]
  source_port_range           = var.security_group_inbound_rules_3["source_port_range"]
  destination_port_range      = var.security_group_inbound_rules_3["destination_port_range"]
  source_address_prefix       = var.security_group_inbound_rules_3["source_address_prefix"]
  destination_address_prefix  = var.security_group_inbound_rules_3["destination_address_prefix"]
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
}
