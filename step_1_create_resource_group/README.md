# Create a resource group

We did the authentication via Azure CLI as described by [Authenticating using the Azure CLI](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/guides/azure_cli), and we will follow [Get Started: Create an Azure resource group using Terraform](https://docs.microsoft.com/en-us/azure/developer/terraform/create-resource-group?tabs=azure-cli) and [Build Infrastructure - Terraform Azure Example](https://learn.hashicorp.com/tutorials/terraform/azure-build?in=terraform/azure-get-started).

Open a Bash.

1. Run "az account show" to find the tenant ID.
2. Check the main.tf, variables.tf, and output.tf files. Update the tenant ID at main.tf.
3. Run "terraform init". If you are using VPN and your proxies are not set up correctly, you may need to disconnect from VPN.
4. Run "terraform fmt" to auto format our .tf files.
5. Run "terraform validate" to validate our configuration.
6. Run "terraform plan -out main.tfplan" to see what will be provisioned.
7. Run "terraform apply main.tfplan" to do the provisioning.
8. Run "echo "$(terraform output resource_group_name)"" to verify the result.
9. Run "az group show --name <resource_group_name>" to verify the result.
10. Run "terraform plan -destroy -out main.destroy.tfplan" and "terraform apply main.destroy.tfplan" to clean up the resources.
