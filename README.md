# Terraform-on-Azure

## Set up Terraform and Azure CLI

Follow the references to set up Terraform and Azure CLI on Windows with Bash. We will use the authentication via Azure CLI, not the service principal. If you have privilege to create an Azure service principal, please do that.

Some useful Azure CLI commands

- az login
- az account show
- az account set --subscription "<subscription_id_or_subscription_name>"

References

- [Get Started - Azure](https://learn.hashicorp.com/collections/terraform/azure-get-started)
- [Set up Terraform and Azure CLI on Windows with Bash](https://docs.microsoft.com/en-us/azure/developer/terraform/get-started-windows-bash?tabs=bash)
- [Authenticating using Azure CLI](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/guides/azure_cli)
- [Terraform documentation for azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/3.2.0)
- [Terraform Language Documentation](https://www.terraform.io/language)

## Folder structure

- tutorials: This is the basic terraform learning steps related to Azure.
- modules: This is where all the common modules are.
- scenarios: This is some sample codes for some target scenarios. This will use the common modules.

## Backlog items to explore

- Create a traditional Azure AD, add users and let VM join.
- Create an Azure AD B2C (tenant, user flow, etc).
