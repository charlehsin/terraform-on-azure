variable "storage_account_name" {
  description = "Name of the storage account."
  type        = string
}

variable "storage_container_name" {
  description = "Name of the storage container."
  type        = string
}

variable "storage_container_access_type" {
  description = "Access type of the storage container."
  type        = string
  default     = "private"
}

variable "storage_blob_name" {
  description = "Name of the storage blob."
  type        = string
}

variable "storage_blob_source" {
  description = "Source of the storage blob."
  type        = string
}
