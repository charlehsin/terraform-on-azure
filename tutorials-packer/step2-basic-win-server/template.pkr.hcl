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
  image_publisher = "MicrosoftWindowsServer"
  image_offer     = "WindowsServer"
  image_sku       = var.server_image_sku

  managed_image_name                = var.image_name
  managed_image_resource_group_name = var.image_resource_group_name
  location                          = var.location

  communicator   = "winrm"
  winrm_use_ssl  = true
  winrm_insecure = true
  winrm_timeout  = "5m"
  winrm_username = "packer"
}

build {
  name    = "learn-packer"
  sources = ["sources.azure-arm.basic-example"]

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
