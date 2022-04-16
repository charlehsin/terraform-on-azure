variable "tenant_id" {
  default     = "xxxxx-xxxx-xxxxx-xxxx-xxxxx"
  description = "Azure tenant ID."
}

variable "resource_group_name" {
  default     = "terraform_rg"
  description = "Name of the resource group."
}

variable "resource_group_location" {
  default     = "westus2"
  description = "Location of the resource group."
}

variable "resource_group_tag_environment" {
  default     = "Terraform environment"
  description = "Environment tag of the resource group."
}

variable "resource_group_tag_team" {
  default     = "Terraform team"
  description = "Team tag of the resource group."
}

variable "virtual_network_name" {
  default     = "myTFVnet"
  description = "Name of the virtual network."
}

variable "virtual_network_address_space" {
  default     = ["10.0.0.0/24"]
  description = "Address space of the virtual network."
}