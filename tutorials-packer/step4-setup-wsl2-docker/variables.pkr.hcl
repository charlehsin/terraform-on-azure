variable "server_image_publisher" {
  type    = string
  default = "MicrosoftWindowsDesktop"
}

variable "server_image_offer" {
  type    = string
  default = "windows-11"
}

variable "server_image_sku" {
  type    = string
  default = "win11-21h2-pro"
}

variable "image_name" {
  type    = string
  default = "MyWinServerImage"
}

variable "image_resource_group_name" {
  type      = string
  default   = "temp"
  sensitive = true
}

variable "location" {
  type    = string
  default = "West US 2"
}

variable "vm_size" {
  type    = string
  default = "Standard_D2s_v4"
}

variable "file_upload_source" {
  type    = string
  default = "./setup-files"
}

variable "file_upload_destination" {
  type    = string
  default = "C:/"
}

variable "file_download_destination" {
  type    = string
  default = "C:/setup-files"
}

variable "file_download_vscode_folder" {
  type    = string
  default = "visual-studio-code-installer"
}

variable "file_download_vscode_url" {
  type    = string
  default = "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user"
}

variable "file_download_sql_server_folder" {
  type    = string
  default = "sql-server-installer"
}

variable "file_download_sql_server_url" {
  type    = string
  default = "https://go.microsoft.com/fwlink/?linkid=866658"
}

variable "file_download_ssms_url" {
  type    = string
  default = "https://aka.ms/ssmsfullsetup"
}
