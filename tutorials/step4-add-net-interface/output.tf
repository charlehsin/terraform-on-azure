output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}

output "network_interface_private_ip_address" {
  value = azurerm_network_interface.net_inf.private_ip_address
}

output "public_ip_address" {
  value = azurerm_public_ip.public_ip.ip_address
}

output "public_ip_fqdn" {
  value = azurerm_public_ip.public_ip.fqdn
}
