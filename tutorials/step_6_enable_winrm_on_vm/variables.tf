variable "tenant_id" {
  default     = "xxxxx-xxxx-xxxxx-xxxx-xxxxx"
  description = "Azure tenant ID."
}

variable "resource_group_name" {
  default     = "terraform_rg1"
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
  default     = "terraform_vnet"
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

variable "security_group_inbound_rules_rdp" {
  type = map(string)
  default = {
    "name"                       = "RDP"
    "priority"                   = 100
    "access"                     = "Allow"
    "protocol"                   = "Tcp"
    "source_port_range"          = "*"
    "destination_port_range"     = "3389"
    "destination_address_prefix" = "*"
  }
}

variable "security_group_inbound_rules_ssh" {
  type = map(string)
  default = {
    "name"                       = "SSH"
    "priority"                   = 101
    "access"                     = "Allow"
    "protocol"                   = "Tcp"
    "source_port_range"          = "*"
    "destination_port_range"     = "22"
    "destination_address_prefix" = "*"
  }
}

variable "security_group_inbound_rules_http" {
  type = map(string)
  default = {
    "name"                       = "HTTP"
    "priority"                   = 102
    "access"                     = "Allow"
    "protocol"                   = "Tcp"
    "source_port_range"          = "*"
    "destination_port_range"     = "80"
    "source_address_prefix"      = "*"
    "destination_address_prefix" = "*"
  }
}

variable "security_group_inbound_rules_winrm" {
  type = map(string)
  default = {
    "name"                       = "WinRM"
    "priority"                   = 103
    "access"                     = "Allow"
    "protocol"                   = "Tcp"
    "source_port_range"          = "*"
    "destination_port_range"     = "5985"
    "destination_address_prefix" = "*"
  }
}

variable "public_ip" {
  type = map(string)
  default = {
    "name"              = "terraform_ip"
    "allocation_method" = "Static"
    "sku"               = "Standard"
    "sku_tier"          = "Regional"
    "domain_name_label" = "tfvmcftest"
  }
}

variable "network_interface" {
  type = map(string)
  default = {
    "name"                                           = "terraform_netinf"
    "enable_accelerated_networking"                  = "true"
    "ip_configuration_name"                          = "terraform_netinf_ipconf"
    "ip_configuration_private_ip_address_version"    = "IPv4"
    "ip_configuration_private_ip_address_allocation" = "Dynamic"
    "ip_configuration_primary"                       = "true"
  }
}

variable "virtual_machine" {
  type = map(string)
  default = {
    "name"                         = "tfvmcftest"
    "size"                         = "Standard_D2s_v4"
    "admin_username"               = "XXX"
    "admin_password"               = "XXX"
    "os_disk_caching"              = "ReadWrite"
    "os_disk_storage_account_type" = "Premium_LRS"
    "image_publisher"              = "MicrosoftWindowsServer"
    "image_offer"                  = "WindowsServer"
    "image_sku"                    = "2019-Datacenter"
    "image_version"                = "latest"
    "timezone"                     = "Pacific Standard Time"
  }
}
