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

resource "azurerm_network_security_rule" "sgrule1" {
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

resource "azurerm_network_security_rule" "sgrule2" {
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

resource "azurerm_network_security_rule" "sgrule3" {
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
