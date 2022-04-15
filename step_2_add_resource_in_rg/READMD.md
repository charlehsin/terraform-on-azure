# Add a resource into the resource group

We did the authentication via Azure CLI as described by [Authenticating using the Azure CLI](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/guides/azure_cli), and we will follow [Change Infrastructure](https://learn.hashicorp.com/tutorials/terraform/azure-change?in=terraform/azure-get-started).

This is based on top of the terraform files in "step_1_create_resource_group".

Open a Bash.

1. Run "az account show" to find the tenant ID.
2. Check the main.tf, variables.tf, and output.tf files. Update the tenant ID at main.tf.
3. Run
