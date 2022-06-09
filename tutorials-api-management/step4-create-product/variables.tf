variable "tenant_id" {
  description = "ID of an existing Azure tenant."
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  description = "Name of the exisiting resource group."
  type        = string
  default     = "apim-cf-001"
}

variable "azurerm_api_management_name" {
  description = "Name of the existing API Management instance."
  type        = string
  default     = "apim-example-cf-001"
}

variable "azurerm_api_management_api_name" {
  description = "Name of the API Management API."
  type        = string
  default     = "apim-example-cf-001-api"
}

variable "azurerm_api_management_api_revision" {
  description = "Name of the API Management API."
  type        = number
  default     = 1
}

variable "azurerm_api_management_product_product_id" {
  description = "Product ID of the API Management API product."
  type        = string
  default     = "test-product-1"
}

variable "azurerm_api_management_product_display_name" {
  description = "Display name of the API Management API product."
  type        = string
  default     = "Test Product 1"
}

variable "azurerm_api_management_product_subscription_required" {
  description = "Subscription required or not for the API Management API product."
  type        = bool
  default     = true
}

variable "azurerm_api_management_product_approval_required" {
  description = "Approval required or not for the API Management API product."
  type        = bool
  default     = false
}

variable "azurerm_api_management_product_published" {
  description = "Published or not for the API Management API product."
  type        = bool
  default     = true
}
