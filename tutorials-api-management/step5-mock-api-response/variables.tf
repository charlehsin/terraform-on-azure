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
  default     = "test-api"
}

variable "azurerm_api_management_api_revision" {
  description = "Revision of the API Management API."
  type        = string
  default     = "1"
}

variable "azurerm_api_management_api_display_name" {
  description = "Display name of the API Management API."
  type        = string
  default     = "Test API"
}

variable "azurerm_api_management_api_protocols" {
  description = "Protocols of the API Management API."
  type        = list(string)
  default     = ["https"]
}

variable "azurerm_api_management_api_operation_id" {
  description = "Operation ID of the API Management API operation."
  type        = string
  default     = "test-call"
}

variable "azurerm_api_management_api_operation_display_name" {
  description = "Display name of the API Management API operation."
  type        = string
  default     = "Test call"
}

variable "azurerm_api_management_api_operation_method" {
  description = "Method of the API Management API operation."
  type        = string
  default     = "GET"
}

variable "azurerm_api_management_api_operation_url_template" {
  description = "Url template of the API Management API operation."
  type        = string
  default     = "/test"
}

variable "azurerm_api_management_api_operation_description" {
  description = "Description of the API Management API operation."
  type        = string
  default     = "This is a test API operation."
}

variable "azurerm_api_management_api_operation_response_status_code" {
  description = "Response status code of the API Management API operation."
  type        = number
  default     = 200
}