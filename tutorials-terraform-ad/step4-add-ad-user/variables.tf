variable "tenant_id" {
  description = "ID of an existing Azure tenant."
  type        = string
  sensitive   = true
}

variable "user_principal_name" {
  description = "UPN of the user."
  type        = string
  default     = "jdoe@cfcontoso2.onmicrosoft.com"
}

variable "display_name" {
  description = "Display name of the user."
  type        = string
  default     = "J. Doe"
}

variable "mail" {
  description = "Email of the user."
  type        = string
  default     = "jdoe@cfcontoso2.onmicrosoft.com"
}

variable "mail_nickname" {
  description = "Email nickname of the user."
  type        = string
  default     = "jdoe"
}

variable "password" {
  description = "Password of the user."
  type        = string
  sensitive   = true
}
