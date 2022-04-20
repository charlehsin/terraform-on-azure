variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "resource_group_location" {
  description = "Location of the resource group."
  type        = string
}

variable "security_group_name" {
  description = "Name of the security group."
  type        = string
}

variable "inbound_rule_source_address_prefix" {
  description = "Source address prefix of the security group inbound rule."
  type        = string
}

variable "security_group_rule" {
  description = "Map of project names to configuration."
  type        = map(any)
  default = {
    rdp = {
      name                   = "RDP",
      priority               = 100,
      destination_port_range = "3389"
    },
    ssh = {
      name                   = "SSH",
      priority               = 101,
      destination_port_range = "22"
    },
    http = {
      name                   = "HTTP",
      priority               = 102,
      destination_port_range = "80"
    },
    winrm = {
      name                   = "WinRM",
      priority               = 103,
      destination_port_range = "5985"
    }
  }
}
