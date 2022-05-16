# Create a resource group

This is the 1st basic task, just to create a new resource group in Azure. This utilizes a "random" resource to create a random resource group name.

We did the authentication via Azure CLI as described by [Authenticating using the Azure CLI](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/guides/azure_cli), and we will follow [Get Started: Create an Azure resource group using Terraform](https://docs.microsoft.com/en-us/azure/developer/terraform/create-resource-group?tabs=azure-cli) and [Build Infrastructure - Terraform Azure Example](https://learn.hashicorp.com/tutorials/terraform/azure-build?in=terraform/azure-get-started).

Open a Bash.

1. If you are behind corporate VPN, run "export HTTPS_PROXY=<proxy_https>" and "export HTTP_PROXY=<proxy_http>".
2. Run "az account show" to find the tenant ID.
3. Check the main.tf, variables.tf, and output.tf files. Update the tenant ID at main.tf.
4. Run "terraform init". If you are using VPN and your proxies are not set up correctly, you may need to disconnect from VPN.
5. Run "terraform fmt" to auto format our .tf files.
6. Run "terraform validate" to validate our configuration.
7. Run "terraform plan -out main.tfplan" to see what will be provisioned.
8. Run "terraform apply main.tfplan" to do the provisioning.
9. Run "echo "$(terraform output resource_group_name)"" to verify the result.
10. Run "az group show --name <resource_group_name>" to verify the result.
11. Run "terraform plan -destroy -out main.destroy.tfplan" and "terraform apply main.destroy.tfplan" to clean up the resources.
