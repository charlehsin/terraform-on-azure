variable "tenant_id" {
  default     = "XXX"
  description = "Azure tenant ID."
}

variable "resource_group_name" {
  default     = "XXX"
  description = "Name of the resource group."
}

variable "resource_group_location" {
  default     = "westus2"
  description = "Location of the resource group."
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
    "ip_configuration_subnet_id"                     = "/subscriptions/XXX"
    "security_group_id"                              = "/subscriptions/XXX"
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

variable "winrm" {
  type = map(string)
  default = {
    "port"    = "5985"
    "https"   = "false"
    "timeout" = "15m"
  }
}
