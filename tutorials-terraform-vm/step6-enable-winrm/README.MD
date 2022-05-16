# Enabled WinRM on Windows VM

This is the 6th step to enabled WinRM on Windows VM. We will use HTTP for WinRM for this example.

We did the authentication via Azure CLI as described by [Authenticating using the Azure CLI](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/guides/azure_cli), and we will follow the following

- [stack overflow discussion](https://stackoverflow.com/questions/69390742/terraform-windows-server-2016-adding-and-running-scripts-using-winery#69401460)
- [Custom data](https://docs.microsoft.com/en-us/azure/virtual-machines/custom-data)
- [Sample winrm.ps1 to set up WinRM](https://gist.github.com/clong/959bc5abe14cb5989c985d4156b5c335)
- [Terraform Provisioners](https://www.terraform.io/language/resources/provisioners/syntax)
- [remote-exec Provisioner](https://www.terraform.io/language/resources/provisioners/remote-exec)
- [When the Provisioner runs](https://www.terraform.io/language/resources/provisioners/syntax#creation-time-provisioners)

Basically, we will do the following in order

1. Use "Data source: data.tf" to figure out the current public IP and use that in the source ip address for security group rules.
2. Use "custom_data" to upload the winrm.ps1 script.
3. Use "additional_unattend_content" to do auto-logon, then copy the custom data back to winrm.ps1, and then run Powershell to execute winrm.ps1.
4. Use "remote-exec Provisioner" to test installing a Windows feature via WinRM.

This is based on top of the terraform files in "step_5_create_windows_vm".

Open a Bash.

1. If you are behind corporate VPN, run "export HTTPS_PROXY=<proxy_https>" and "export HTTP_PROXY=<proxy_http>".
2. Run "az account show" to find the tenant ID.
3. Check the main.tf, variables.tf, and output.tf files. Update the tenant ID at variables.tf. Update the VM account and password at variables.tf. Update the storage account uri at variables.tf.
4. Run "terraform init".
5. Run "terraform fmt" to auto format our .tf files.
6. Run "terraform validate" to validate our configuration.
7. Run "terraform plan -out main.tfplan" to see what will be provisioned.
8. Run "terraform apply main.tfplan" to do the provisioning.
9. Run "terraform show" to see the new state.
10. Run "terraform state list" to see the latest list of resources managed.
11. Run some output commands, e.g., "echo "$(terraform output resource_group_name)"", to verify the result.
12. Run "terraform plan -destroy -out main.destroy.tfplan" and "terraform apply main.destroy.tfplan" to clean up the resources.
