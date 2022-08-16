# Terraform-on-Azure

## Set up Terraform and Azure CLI

Follow the references to set up Terraform and Azure CLI on Windows with Bash. We will use the authentication via Azure CLI, not the service principal. If you have privilege to create an Azure service principal, please do that.

Some useful Azure CLI commands

- az login
- az account show
- az account set --subscription "<subscription_id_or_subscription_name>"

## Folder structure

- tutorials: This is the basic learning steps (related to Azure) for each topic.
- modules: This is where all the common modules are.
- scenarios: This is some sample codes for some target scenarios. This will use the common modules.

## Backlog items to explore

- Use terraform to create Azure AD user and register app.
  - Note: Currently, there is no Powershell/Azure CLI/Terraform way to create a tenant in Azure AD. However, Terraform has support to create new user and register app.
- Azure API Management with subscription, policies, and JWT.

## References

- [Get Started - Azure](https://learn.hashicorp.com/collections/terraform/azure-get-started)
- [Set up Terraform and Azure CLI on Windows with Bash](https://docs.microsoft.com/en-us/azure/developer/terraform/get-started-windows-bash?tabs=bash)
- [Authenticating using Azure CLI](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/guides/azure_cli)
