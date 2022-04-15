variable "resource_group_name_prefix" {
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "resource_group_location" {
  default     = "westus2"
  description = "Location of the resource group."
}

variable "virtual_network_name" {
  default     = "myTFVnet"
  description = "Name of the virtual network."
}

variable "virtual_network_address_space" {
  default     = ["10.0.0.0/16"]
  description = "Address space of the virtual network."
}