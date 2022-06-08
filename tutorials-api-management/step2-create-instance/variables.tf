variable "tenant_id" {
  description = "ID of an existing Azure tenant."
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
  default     = "apim-cf-001"
}

variable "resource_group_location" {
  description = "Location of the resource group."
  type        = string
  default     = "West Europe"
}

variable "azurerm_api_management_name" {
  description = "Name of the API Management instance."
  type        = string
  default     = "apim-example-cf-001"
}

variable "azurerm_api_management_publisher_name" {
  description = "Publisher name of the API Management instance."
  type        = string
  default     = "Contoso"
}

variable "azurerm_api_management_publisher_email" {
  description = "Publisher email of the API Management instance."
  type        = string
  sensitive   = true
}

variable "azurerm_api_management_sku_name" {
  description = "SKU name of the API Management instance."
  type        = string
  default     = "Developer_1"
}
