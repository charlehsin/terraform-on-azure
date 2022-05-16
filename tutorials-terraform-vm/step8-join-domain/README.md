# Create a Windows VM in an existing subnet and join an existing domain

This is the 8th step to create a Windows VM in an existing subnet and to join an existing domain.

We did the authentication via Azure CLI as described by [Authenticating using the Azure CLI](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/guides/azure_cli). We will use PowerShell scripts to do the following setups.

1. Set up the DNS servers for the network adaptor so that the VM can talk to the ADDC and to the Azure DNS service.
2. Add the computer to the domain.
3. Delete the sensitive script file with credentials.  Note: This is just a temporary approach and should not be used in production. Need a more secure approach to handle the credentials.

The following articles are just for reference, and we did not use them in this example.

- [azurerm_virtual_machine_extension](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension)
- [MSDN documentation](https://docs.microsoft.com/en-us/azure/active-directory-domain-services/join-windows-vm-template)
- [Sample instructions](https://pixelrobots.co.uk/2019/03/use-terraform-to-join-a-new-azure-virtual-machine-to-a-domain/)

This is based on top of the terraform files in "step_7_upload_directories_to_vm".

Make sure your AD service is up and running, and your security group has WinRM port open. Open a Bash.

1. If you are behind corporate VPN, run "export HTTPS_PROXY=<proxy_https>" and "export HTTP_PROXY=<proxy_http>".
2. Run "az account show" to find the tenant ID.
3. Check the main.tf, variables.tf, and output.tf files. Update the following at variables.tf.
   - Tenant ID
   - Resource group name and location.
   - Subnet ID.
   - Security group ID.
   - VM account and password.
4. Update the following
   - At to_upload/setup/setup_netadaptor.ps1
      - The address of the ADDC.
      - The address ot the Azure DNS service for VMs.
   - At to_upload/setup/setup_join_domain.ps1
      - Domain name
      - Domain credential
5. Run "terraform init".
6. Run "terraform fmt" to auto format our .tf files.
7. Run "terraform validate" to validate our configuration.
8. Run "terraform plan -out main.tfplan" to see what will be provisioned.
9. Run "terraform apply main.tfplan" to do the provisioning.
10. Run "terraform show" to see the new state.
11. Run "terraform state list" to see the latest list of resources managed.
12. Run some output commands, e.g., "echo "$(terraform output public_ip_fqdn)"", to verify the result.
13. Run "terraform plan -destroy -out main.destroy.tfplan" and "terraform apply main.destroy.tfplan" to clean up the resources.
