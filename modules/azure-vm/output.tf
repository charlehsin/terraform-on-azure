output "virtual_machine_id" {
  description = "ID of the virtual machine."
  value       = azurerm_windows_virtual_machine.vm.id
}

output "virtual_machine_private_ip" {
  description = "Primary Private IP Address of the virtual network."
  value       = azurerm_windows_virtual_machine.vm.private_ip_address
}

output "virtual_machine_public_ip" {
  description = "Primary Public IP Address of the virtual network."
  value       = azurerm_windows_virtual_machine.vm.public_ip_address
}
