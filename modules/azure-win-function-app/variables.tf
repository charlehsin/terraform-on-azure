variable "resource_group_name" {
  description = "Name of the existing resource group."
  type        = string
}

variable "resource_group_location" {
  description = "Location of the existing resource group."
  type        = string
  default     = "West Europe"
}

variable "app_service_plan_name" {
  description = "Name of the application service plan."
  type        = string
}

variable "app_service_plan_os_type" {
  description = "OS type of the application service plan."
  type        = string
  default     = "Windows"
}

variable "app_service_plan_sku_name" {
  description = "SKU name of the application service plan."
  type        = string
  default     = "Y1"
}

variable "function_app_name" {
  description = "Name of the function app."
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account."
  type        = string
}

variable "storage_account_primary_access_key" {
  description = "Primary access key of the storage account."
  type        = string
}

variable "storage_container_name" {
  description = "Name of the storage container where the Function App files are uploaded."
  type        = string
}

variable "storage_blob_name" {
  description = "Name of the storage blob where the Function App files are uploaded."
  type        = string
}

variable "storage_account_blob_container_sas" {
  description = "SAS of the storage account blob container where the Function App files are uploaded."
  type        = string
}

variable "function_app_node_version" {
  description = "Node version of the Function App."
  type        = string
  default     = "~14"
}
