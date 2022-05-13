variable "tenant_id" {
  description = "ID of an existing Azure tenant."
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  description = "Name of the existing resource group."
  type        = string
  default     = "cffunction-rg-001"
}

variable "resource_group_location" {
  description = "Location of the existing resource group."
  type        = string
  default     = "West Europe"
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
