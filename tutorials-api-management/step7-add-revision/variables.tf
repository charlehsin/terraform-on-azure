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
  default     = "conference"
}

variable "azurerm_api_management_api_protocols" {
  description = "Protocols of the API Management API."
  type        = list(string)
  default     = ["https"]
}

variable "azurerm_api_management_api_service_url" {
  description = "Backend service url of the API Management API."
  type        = string
  default     = "https://conferenceapi.azurewebsites.net"
}

variable "azurerm_api_management_api_import_content_format" {
  description = "Content format of the API Management API import."
  type        = string
  default     = "swagger-link-json"
}

variable "azurerm_api_management_api_import_content_value" {
  description = "Content value of the API Management API import."
  type        = string
  default     = "https://conferenceapi.azurewebsites.net?format=json"
}

variable "azurerm_api_management_api_2_revision" {
  description = "Revision of the API Management API with new revision."
  type        = string
  default     = "2"
}

variable "azurerm_api_management_api_2_revision_description" {
  description = "Revision description of the API Management API with new revision."
  type        = string
  default     = "Creating a Revision of an existing API."
}
