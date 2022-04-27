# Use File provisioner and Powershell provisioner

We will create a [managed image](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/capture-image-resource). This is using the basic Windows Server image, then we do the following in order.

1. Upload our target files.
2. Install IIS.
3. Download Visual Studio Code installer.
4. Download SQL Server installer.
5. Download SQL Server Management Studio installer.

We did the authentication via Azure CLI as described by [Azure CLI](https://www.packer.io/plugins/builders/azure#azure-cli). We follow

1. [File Provisioner](https://www.packer.io/docs/provisioners/file)
2. [PowerShell Provisioner](https://www.packer.io/docs/provisioners/powershell)

Open a Bash. (It will be smoother if you are disconnected from VPN.)

1. Run "az account set --subscription <subscription_id_or_subscription_name>" to set correct subscription, and then "az account show" to find the tenant ID.
2. Update input.pkrvars.hcl file.
3. Run "packer init ."
4. Run "packer fmt ."
5. Run "packer validate ."
6. Run "packer build --var-file=inputs.pkrvars.hcl .".
   - This may take a while.
   - If the provisioner is stuck, press Ctrl+C to cancel the build and start the clean-up flow.
7. The created image will be inside the specified resource group. You can see it on your Azure portal.
