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

variable "load_balancer_name" {
  description = "Name of the load balancer."
  type        = string
}

variable "load_balancer_sku" {
  description = "SKU  of the load balancer."
  type        = string
}

variable "frontend_ip_config_name" {
  description = "Name of the frontend IP configuration."
  type        = string
}

variable "backend_address_pool_name" {
  description = "Name of the backend address pool."
  type        = string
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
      number_of_probes          = 2
      session_persistence       = "SourceIP"
    }
  }
}
