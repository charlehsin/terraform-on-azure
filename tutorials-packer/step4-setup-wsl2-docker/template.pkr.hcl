packer {
  required_plugins {
    azure = {
      version = ">= 1.0.6"
      source  = "github.com/hashicorp/azure"
    }
  }
}

source "azure-arm" "basic-example" {
  # We are using Azure CLI to authenticate, so we only need use_azure_cli_auth.
  #client_id = ""
  #client_secret = ""
  #subscription_id = ""
  #tenant_id = ""
  use_azure_cli_auth = true

  os_type         = "Windows"
  image_publisher = var.server_image_publisher
  image_offer     = var.server_image_offer
  image_sku       = var.server_image_sku

  managed_image_name                = var.image_name
  managed_image_resource_group_name = var.image_resource_group_name
  location                          = var.location
  vm_size                           = var.vm_size

  communicator   = "winrm"
  winrm_use_ssl  = true
  winrm_insecure = true
  winrm_timeout  = "5m"
  winrm_username = "packer"
}

build {
  name    = "learn-packer"
  sources = ["sources.azure-arm.basic-example"]

  # Enable WSL2 - step 1
  provisioner "powershell" {
    inline = [
      "Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName Microsoft-Windows-Subsystem-Linux",
      "Write-Output 'Microsoft-Windows-Subsystem-Linux is enabled.'"
    ]
  }
  # Enable WSL2 - step 2
  provisioner "windows-restart" {
    restart_check_command = "powershell -command \"& {Write-Output 'restarted.'}\""
  }
  # Enable WSL2 - step 3
  provisioner "powershell" {
    inline = [
      "Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName VirtualMachinePlatform",
      "Write-Output 'VirtualMachinePlatform is enabled.'"
    ]
  }
  # Enable WSL2 - step 4
  provisioner "windows-restart" {
    restart_check_command = "powershell -command \"& {Write-Output 'restarted.'}\""
  }
  # Enable WSL2 - step 5
  provisioner "powershell" {
    inline = [
      "wsl --set-default-version 2",
      "wsl --update",
      "wsl --shutdown",
      "Write-Output 'WSL2 is set up.'"
    ]
  }

  # Upload files
  provisioner "file" {
    source      = var.file_upload_source
    destination = var.file_upload_destination
  }

  # Install IIS. Download Visual Studio Code. Download SQL Server.
  # Download SQL Server Management Studio. Install SQL Server Management Studio.
  # Install-WindowsFeature is only for Windows Server. For Windows Client, use the following
  # Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole, IIS-WebServer, IIS-CommonHttpFeatures, IIS-ManagementConsole, IIS-HttpErrors, IIS-HttpRedirect, IIS-WindowsAuthentication, IIS-StaticContent, IIS-DefaultDocument, IIS-HttpCompressionStatic, IIS-DirectoryBrowsing
  provisioner "powershell" {
    inline = [
      "Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole, IIS-WebServer, IIS-CommonHttpFeatures, IIS-ManagementConsole, IIS-HttpErrors, IIS-HttpRedirect, IIS-WindowsAuthentication, IIS-StaticContent, IIS-DefaultDocument, IIS-HttpCompressionStatic, IIS-DirectoryBrowsing",
      "Write-Output 'IIS is installed.'",
      "$ProgressPreference = 'SilentlyContinue'",
      "New-Item -Path '${var.file_download_destination}' -Name '${var.file_download_vscode_folder}' -ItemType 'directory'",
      "Set-Location '${var.file_download_destination}/${var.file_download_vscode_folder}'",
      "Invoke-WebRequest -Uri '${var.file_download_vscode_url}' -OutFile VSCodeUserSetup.exe",
      "Write-Output 'VS Code installer is downloaded.'",
      "New-Item -Path '${var.file_download_destination}' -Name '${var.file_download_sql_server_folder}' -ItemType 'directory'",
      "Set-Location '${var.file_download_destination}/${var.file_download_sql_server_folder}'",
      "Invoke-WebRequest -Uri '${var.file_download_sql_server_url}' -OutFile SQL2019-SSEI-Expr.exe",
      "Write-Output 'SQL Server installer is downloaded.'",
      "Invoke-WebRequest -Uri '${var.file_download_ssms_url}' -OutFile SSMS-Setup-ENU.exe",
      "Write-Output 'SQL Server Management Studio installer is downloaded.'"
    ]
  }

  # Deprovision the image - step 1
  provisioner "powershell" {
    inline = [
      "Set-Service RdAgent -StartupType Disabled",
      "Set-Service WindowsAzureTelemetryService -StartupType Disabled",
      "Set-Service WindowsAzureGuestAgent -StartupType Disabled",
      "Remove-ItemProperty -Path 'HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Setup\\SysPrepExternal\\Generalize' -Name '*'"
    ]
  }
  # Deprovision the image - step 2
  provisioner "windows-restart" {
    restart_check_command = "powershell -command \"& {Write-Output 'restarted.'}\""
  }
  # Deprovision the image - step 3
  provisioner "powershell" {
    inline = [
      "& $env:SystemRoot\\System32\\Sysprep\\Sysprep.exe /oobe /generalize /quiet /quit /mode:vm",
      "while($true) { $imageState = Get-ItemProperty HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Setup\\State | Select ImageState; if($imageState.ImageState -ne 'IMAGE_STATE_GENERALIZE_RESEAL_TO_OOBE') { Write-Output $imageState.ImageState; Start-Sleep -s 10  } else { break } }"
    ]
  }
}
