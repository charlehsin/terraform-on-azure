variable "tenant_id" {
  description = "ID of an existing Azure tenant."
  type        = string
  sensitive   = true
}

variable "display_name" {
  description = "Display name of the app."
  type        = string
  default     = "MyWebApp"
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

variable "web_homepage_url" {
  description = "Homepage url of the web app."
  type        = string
  default     = "https://localhost:44321"
}

variable "web_logout_url" {
  description = "Logout url of the web app."
  type        = string
  default     = "https://localhost:44321/signout-oidc"
}

variable "web_redirect_uris" {
  description = "Redirect uris of the web app."
  type        = list(string)
  default     = ["https://localhost:44321/signin-oidc"]
}

variable "web_access_token_issuance_enabled" {
  description = "For implicit grant flow, is web access token issuance enabled."
  type        = bool
  default     = true
}

variable "web_id_token_issuance_enabled" {
  description = "For implicit grant flow, is id token issuance enabled."
  type        = bool
  default     = true
}
