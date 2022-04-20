output "security_group_id" {
  description = "ID of the security group."
  value       = azurerm_network_security_group.sg.id
}
