variable "tenant_id" {
  description = "ID of an existing Azure tenant."
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  description = "Name of the existing resource group."
  type        = string
  default     = "apim-cf-001"
}

variable "azurerm_api_management_name" {
  description = "Name of the existing API Management instance."
  type        = string
  default     = "apim-example-cf-001"
}

variable "storage_account_name" {
  description = "Name of the storage account."
  type        = string
  default     = "cfstorageaccount0001"
}

variable "storage_container_name" {
  description = "Name of the storage container."
  type        = string
  default     = "cfstoragecontainer0001"
}

variable "app_service_plan_name" {
  description = "Name of the application service plan."
  type        = string
  default     = "cffunction-serviceplan0001"
}

variable "function_app_name" {
  description = "Name of the function app."
  type        = string
  default     = "cffunction0001"
}

variable "azurerm_api_management_api_name" {
  description = "Name of the API Management API."
  type        = string
  default     = "apim-example-cf-001-api"
}

variable "azurerm_api_management_api_revision" {
  description = "Revision of the API Management API."
  type        = string
  default     = "1"
}

variable "azurerm_api_management_api_display_name" {
  description = "Display name of the API Management API."
  type        = string
  default     = "CF Example API 1"
}

variable "azurerm_api_management_api_path" {
  description = "Path of the API Management API."
  type        = string
  default     = "dummy"
}

variable "azurerm_api_management_api_protocols" {
  description = "Protocols of the API Management API."
  type        = list(string)
  default     = ["https"]
}

variable "azurerm_api_management_api_import_content_format" {
  description = "Content format of the API Management API import."
  type        = string
  default     = "openapi"
}

variable "azurerm_api_management_api_import_content_value" {
  description = "Content value of the API Management API import."
  type        = string
  default     = "openapi-spec.yml"
}

variable "azurerm_api_management_named_value_name" {
  description = "Name of the API Management named value."
  type        = string
  default     = "func-accesskey"
}

variable "azurerm_api_management_named_value_display_name" {
  description = "Display name of the API Management named value."
  type        = string
  default     = "func-accesskey"
}

variable "azurerm_api_management_backend_name" {
  description = "Name of the API Management backend."
  type        = string
  default     = "cf-backend"
}
