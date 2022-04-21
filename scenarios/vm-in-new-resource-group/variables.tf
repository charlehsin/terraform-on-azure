variable "tenant_id" {
  description = "Azure tenant ID."
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
  default     = "terraform_rg"
}

variable "resource_group_location" {
  description = "Location of the resource group."
  type        = string
  default     = "westus2"
}

variable "virtual_network_name" {
  description = "Name of the virtual network."
  type        = string
  default     = "terraform_vnet"
}

variable "virtual_network_address_space" {
  description = "Address space of the virtual network."
  type        = list(string)
  default     = ["10.0.0.0/24"]
}

variable "subnet_name" {
  description = "Name of the subnet."
  type        = string
  default     = "default"
}

variable "subnet_name_address_space" {
  description = "Address space of the subnet."
  type        = list(string)
  default     = ["10.0.0.0/24"]
}

variable "security_group_name" {
  description = "Name of the security group."
  type        = string
  default     = "terraform_security_group"
}

variable "public_ip" {
  description = "Properties of the public IP."
  type        = map(string)
  default = {
    "name"              = "terraform_ip"
    "allocation_method" = "Static"
    "sku"               = "Standard"
    "domain_name_label" = "tfvmcftest"
  }
}

variable "network_interface" {
  description = "Properties of the network interface."
  type        = map(string)
  default = {
    "name"                  = "terraform_netinf"
    "ip_configuration_name" = "terraform_netinf_ipconf"
  }
}

variable "virtual_machine_name" {
  description = "Name of the virtual machine."
  type        = string
  default     = "tfvmcftest"
}

variable "virtual_machine_size" {
  description = "Size of the virtual machine."
  type        = string
  default     = "Standard_D2s_v4"
}

variable "virtual_machine_admin_username" {
  description = "Admin username of the virtual machine."
  type        = string
  sensitive   = true
}

variable "virtual_machine_admin_password" {
  description = "Admin password of the virtual machine."
  type        = string
  sensitive   = true
}

variable "virtual_machine_timezone" {
  description = "Timezone of the virtual machine."
  type        = string
  default     = "Pacific Standard Time"
}

variable "source_image_sku" {
  description = "SKU of the source image."
  type        = string
  default     = "2019-Datacenter"
}

variable "file_upload_target" {
  description = "Target directory of the file upload."
  type        = string
  default     = "C:/upload_files"
}

variable "remote_commands" {
  description = "List of remote commands to run."
  type        = list(string)
  default = [
    "powershell.exe -sta -ExecutionPolicy Unrestricted -file C:/upload_files/dir1/installiis.ps1",
  ]
}
