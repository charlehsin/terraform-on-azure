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

variable "public_ip_lb" {
  description = "Properties of the public IP for the load balancer."
  type        = map(string)
  default = {
    "name"              = "terraform-lb-ip"
    "allocation_method" = "Static"
    "sku"               = "Standard"
    "domain_name_label" = "lbcfterraformtest"
  }
}

variable "load_balancer" {
  description = "Properties of the load balancer."
  type        = map(string)
  default = {
    "name" = "terraform-lb"
    "sku"  = "Standard"
  }
}

variable "frontend_ip_config_name" {
  description = "Name of the frontend IP configuration."
  type        = string
  default     = "terraform-lb-public-ip-address"
}

variable "backend_address_pool_name" {
  description = "Name of the backend address pool."
  type        = string
  default     = "terraform-lb-backend-pool"
}

variable "backend_address_pool_address_name" {
  description = "Name of the backend address pool address."
  type        = string
  default     = "terraform-lb-backend-pool-addr"
}

variable "lb_applications" {
  description = "Map of the applications using the load balancer."
  type        = map(any)
  default = {
    http = {
      protocol                  = "Tcp",
      frontend_port             = 80,
      backend_port              = 80,
      probe_port                = 80,
      probe_interval_in_seconds = 15,
      number_of_probes          = 2,
      session_persistence       = "SourceIP"
    },
    https = {
      protocol                  = "Tcp",
      frontend_port             = 443,
      backend_port              = 443,
      probe_port                = 443,
      probe_interval_in_seconds = 14,
      number_of_probes          = 3,
      session_persistence       = "SourceIP"
    }
  }
}
