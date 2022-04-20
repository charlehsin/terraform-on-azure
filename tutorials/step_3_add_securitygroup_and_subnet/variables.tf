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

variable "subnet_name" {
  default     = "default"
  description = "Name of the subnet."
}

variable "subnet_name_address_space" {
  default     = ["10.0.0.0/24"]
  description = "Address space of the subnet."
}

variable "security_group_name" {
  default     = "terraform_security_group"
  description = "Name of the security group."
}

variable "security_group_inbound_rules_1" {
  type = map(string)
  default = {
    "name"                       = "RDP"
    "priority"                   = 100
    "access"                     = "Allow"
    "protocol"                   = "Tcp"
    "source_port_range"          = "*"
    "destination_port_range"     = "3389"
    "source_address_prefix"      = "134.134.137.84"
    "destination_address_prefix" = "*"
  }
}

variable "security_group_inbound_rules_2" {
  type = map(string)
  default = {
    "name"                       = "SSH"
    "priority"                   = 101
    "access"                     = "Allow"
    "protocol"                   = "Tcp"
    "source_port_range"          = "*"
    "destination_port_range"     = "22"
    "source_address_prefix"      = "134.134.137.84"
    "destination_address_prefix" = "*"
  }
}

variable "security_group_inbound_rules_3" {
  type = map(string)
  default = {
    "name"                       = "HTTPS"
    "priority"                   = 102
    "access"                     = "Allow"
    "protocol"                   = "Tcp"
    "source_port_range"          = "*"
    "destination_port_range"     = "443"
    "source_address_prefix"      = "*"
    "destination_address_prefix" = "*"
  }
}
