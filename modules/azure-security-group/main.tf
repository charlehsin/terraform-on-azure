resource "azurerm_network_security_group" "sg" {
  name                = var.security_group_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "sg_rule" {
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  source_address_prefix       = var.inbound_rule_source_address_prefix
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.sg.name

  for_each = var.security_group_rule
}
