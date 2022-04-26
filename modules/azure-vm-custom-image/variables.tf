variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "resource_group_location" {
  description = "Location of the resource group."
  type        = string
}

variable "public_ip_name" {
  description = "Name of the public IP."
  type        = string
}

variable "public_ip_allocation_method" {
  description = "Allocation method of the public IP."
  type        = string
}

variable "public_ip_sku" {
  description = "SKU of the public IP."
  type        = string
}

variable "public_ip_domain_name_label" {
  description = "Domain name label of the public IP."
  type        = string
}

variable "network_interface_name" {
  description = "Name of the network interface."
  type        = string
}

variable "ip_configuration_name" {
  description = "Name of the ip configuration."
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet."
  type        = string
}

variable "security_group_id" {
  description = "ID of the security group."
  type        = string
}

variable "virtual_machine_name" {
  description = "Name of the virtual machine."
  type        = string
}

variable "virtual_machine_size" {
  description = "Size of the virtual machine."
  type        = string
}

variable "virtual_machine_admin_username" {
  description = "User name of the admin user."
  type        = string
}

variable "virtual_machine_admin_password" {
  description = "Password of the admin user."
  type        = string
}

variable "virtual_machine_timezone" {
  description = "Timezone of the virtual machine."
  type        = string
}

variable "virtual_machine_custom_data_path" {
  description = "Full path of the custom data file."
  type        = string
}

variable "virtual_machine_first_cmd_path" {
  description = "Full path of the first logon command file."
  type        = string
}

variable "source_custom_image_name" {
  description = "Name of the custom image."
  type        = string
}

variable "source_custom_image_resource_group" {
  description = "Resource group of the custom image."
  type        = string
}

variable "upload_source" {
  description = "Source path of the to-be-uploaded content."
  type        = string
}

variable "upload_destination" {
  description = "Destination path of the to-be-uploaded content."
  type        = string
}

variable "remote_commands" {
  description = "List of commands to run on the virtual machine."
  type        = list(string)
}
