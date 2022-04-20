variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "resource_group_location" {
  description = "Location of the resource group."
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the virtual network."
  type        = string
}

variable "virtual_network_address_space" {
  description = "Address space of the virtual network."
  type        = list(string)
}

variable "subnet_name" {
  description = "Name of the subnet."
  type        = string
}

variable "subnet_name_address_space" {
  description = "Address space of the subnet."
  type        = list(string)
}
