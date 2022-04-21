output "virtual_machine_id" {
  description = "ID of the virtual machine."
  value       = module.virtual_machine.virtual_machine_id
}

output "virtual_machine_private_ip" {
  description = "Primary Private IP Address of the virtual network."
  value       = module.virtual_machine.virtual_machine_private_ip
}

output "virtual_machine_public_ip" {
  description = "Primary Public IP Address of the virtual network."
  value       = module.virtual_machine.virtual_machine_public_ip
}
