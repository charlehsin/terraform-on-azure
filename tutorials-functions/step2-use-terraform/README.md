# Get started on using Terraform to deploy Azure Functions

This is based on the knowledge on top of "step1-ramp-up".

We did the authentication via Azure CLI as described by [Authenticating using the Azure CLI](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/guides/azure_cli), and we will follow the following

- [Deploy Azure Functions with Terraform](https://www.maxivanov.io/deploy-azure-functions-with-terraform/)
- [https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_function_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_function_app)

Open a Bash. (It will be smoother if you are disconnected from VPN.)

1. Run "az account set --subscription <subscription_id_or_subscription_name>" to set correct subscription, and then "az account show" to find the tenant ID.
