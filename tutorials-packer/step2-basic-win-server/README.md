# Create basic Windows Server image

We will create a [managed image](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/capture-image-resource). This is just using the basic Windows Server image without too much change.

We did the authentication via Azure CLI as described by [Azure CLI](https://www.packer.io/plugins/builders/azure#azure-cli). We follow

1. [Packer Plugin Azure](https://github.com/hashicorp/packer-plugin-azure)
2. [Azure Resource Manager Builder](https://www.packer.io/plugins/builders/azure/arm)
3. [PowerShell: How to use Packer to create virtual machine images in Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/build-image-with-packer)
4. [Build a Windows Image](https://learn.hashicorp.com/tutorials/packer/aws-windows-image?in=packer/integrations)
5. [WinRM Communicator](https://www.packer.io/docs/communicators/winrm)
6. [Error: IMAGE_STATE_UNDEPLOYABLE with Packer and Azure](https://automatingops.com/error-imagestateundeployable-with-packer-and-azure)
7. [Image sysprep not completing](https://groups.google.com/g/packer-tool/c/jH2gTQWdjSU)

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
