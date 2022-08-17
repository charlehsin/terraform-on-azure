variable "tenant_id" {
  description = "ID of an existing Azure tenant."
  type        = string
  sensitive   = true
}

variable "display_name" {
  description = "Display name of the app."
  type        = string
  default     = "MySpaApp"
}

variable "sign_in_audience" {
  description = "Sign-in audience of the app."
  type        = string
  default     = "AzureADMyOrg"
}

variable "client_secrete_display_name" {
  description = "Display name of the client secrete."
  type        = string
  default     = "MyClientSecrete"
}

variable "client_secrete_end_date_relative" {
  description = "Relative end data of the client secrete."
  type        = string
  default     = "8760h" # 365 days
}

variable "single_page_application_redirect_uris" {
  description = "Redirect uris of the single page app."
  type        = list(string)
  default     = ["http://localhost:3000/"]
}
