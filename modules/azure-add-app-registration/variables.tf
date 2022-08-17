variable "display_name" {
  description = "Display name of the app."
  type        = string
}

variable "owners" {
  description = "Owners of the app."
  type        = list(string)
}

variable "sign_in_audience" {
  description = "Sign-in audience of the app."
  type        = string
}

variable "logo_image" {
  description = "Logo image of the app."
  type        = string
  default     = ""
}

variable "client_secrete_display_name" {
  description = "Display name of the client secrete."
  type        = string
}

variable "client_secrete_end_date_relative" {
  description = "Relative end data of the client secrete."
  type        = string
}

variable "web_required" {
  description = "Require to have web block."
  type        = bool
  default     = false
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

variable "single_page_application_required" {
  description = "Require to have single_page_application block."
  type        = bool
  default     = false
}

variable "single_page_application_redirect_uris" {
  description = "Redirect uris of the single page app."
  type        = list(string)
  default     = ["http://localhost:3000/"]
}

variable "public_client_required" {
  description = "Require to have public_client block."
  type        = bool
  default     = false
}

variable "public_client_redirect_uris" {
  description = "Redirect uris of the public client."
  type        = list(string)
  default     = ["https://login.microsoftonline.com/common/oauth2/nativeclient", "http://localhost"]
}
