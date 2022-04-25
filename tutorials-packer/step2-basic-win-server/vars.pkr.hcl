variable "server_image_sku" {
  type    = string
  default = "2019-Datacenter"
}

variable "image_name" {
  type    = string
  default = "MyWinServerImage"
}

variable "image_resource_group_name" {
  type      = string
  default   = "temp"
  sensitive = true
}

variable "location" {
  type    = string
  default = "West US 2"
}
