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

- Move API creation to a module: Currently, finished at step 6.
- Azure API Management with Functions

## References

- [Get Started - Azure](https://learn.hashicorp.com/collections/terraform/azure-get-started)
- [Set up Terraform and Azure CLI on Windows with Bash](https://docs.microsoft.com/en-us/azure/developer/terraform/get-started-windows-bash?tabs=bash)
- [Authenticating using Azure CLI](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/guides/azure_cli)
