variable "resource_group_name" {
  description = "Name of the exisiting resource group."
  type        = string
}

variable "azurerm_api_management_name" {
  description = "Name of the existing API Management instance."
  type        = string
}

variable "azurerm_api_management_api_name" {
  description = "Name of the API Management API."
  type        = string
}

variable "azurerm_api_management_api_revision" {
  description = "Revision of the API Management API."
  type        = string
}

variable "azurerm_api_management_api_revision_description" {
  description = "Revision description of the API Management API."
  type        = string
  default     = ""
}

variable "azurerm_api_management_api_display_name" {
  description = "Display name of the API Management API."
  type        = string
  default     = ""
}

variable "azurerm_api_management_api_path" {
  description = "Path of the API Management API."
  type        = string
  default     = ""
}

variable "azurerm_api_management_api_protocols" {
  description = "Protocols of the API Management API."
  type        = list(string)
}

variable "azurerm_api_management_api_service_url" {
  description = "Backend service url of the API Management API."
  type        = string
  default     = ""
}

variable "azurerm_api_management_api_source_api_id" {
  description = "Source API ID of the API Management API."
  type        = string
  default     = ""
}

variable "azurerm_api_management_api_version" {
  description = "Version of the API Management API."
  type        = string
  default     = ""
}

variable "azurerm_api_management_api_version_set_id" {
  description = "Version set ID of the API Management API."
  type        = string
  default     = ""
}

variable "azurerm_api_management_api_import_required" {
  description = "Require to provide import information or not."
  type        = bool
  default     = false
}

variable "azurerm_api_management_api_import_content_format" {
  description = "Content format of the API Management API import. Provide meaningful value if it is required to provide import information."
  type        = string
  default     = ""
}

variable "azurerm_api_management_api_import_content_value" {
  description = "Content value of the API Management API import. Provide meaningful value if it is required to provide import information."
  type        = string
  default     = ""
}
