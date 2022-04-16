# Create a Windows VM into the resource group

This is the 5th step to create a Windows VM into the resource group.

We did the authentication via Azure CLI as described by [Authenticating using the Azure CLI](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/guides/azure_cli), and we will follow the following

- [azurerm_windows_virtual_machine](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine)

This is based on top of the terraform files in "step_4_add_net_interface".

Open a Bash.

1. Run "az account show" to find the tenant ID.
2. Check the main.tf, variables.tf, and output.tf files. Update the tenant ID at variables.tf.
3. Run "terraform init". If you are using VPN and your proxies are not set up correctly, you may need to disconnect from VPN.
4. Run "terraform fmt" to auto format our .tf files.
5. Run "terraform validate" to validate our configuration.
