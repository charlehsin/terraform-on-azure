# Get started on using Terraform to create an Azure API Management instance

This is based on the knowledge on top of "step1-ramp-up".

We did the authentication via Azure CLI as described by [Authenticating using the Azure CLI](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/guides/azure_cli), and we will follow the following

- [Deploying API management with terraform](https://rakesh-suryawanshi.medium.com/deploying-api-management-with-terraform-5a755f7434df)
- [azurerm_api_management](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management)
- [Quickstart: Create a new Azure API Management service instance by using the Azure CLI](https://docs.microsoft.com/en-us/azure/api-management/get-started-create-service-instance-cli)

Open a Bash.

1. If you are behind corporate VPN, run "export HTTPS_PROXY=<proxy_https>" and "export HTTP_PROXY=<proxy_http>".
2. Run "az account set --subscription <subscription_id_or_subscription_name>" to set correct subscription, and then "az account show" to find the tenant ID.
3. Update secret.tfvars and backend.conf.
4. Run "terraform init -backend-config=backend.conf".
5. Run "terraform fmt -recursive".
6. Run "terraform validate" to validate our configuration.
7. Run "terraform plan -out main.tfplan -var-file=./secret.tfvars" to see what will be provisioned.
8. Run "terraform apply main.tfplan" to do the provisioning.
9. Run "terraform show" to see the new state.
10. Run "terraform state list" to see the latest list of resources managed.
11. Run some output commands, e.g., "echo "$(terraform output id)"", to verify the result.
12. Run "terraform plan -destroy -out main.destroy.tfplan -var-file=./secret.tfvars" and "terraform apply main.destroy.tfplan" to clean up the resources.

## References

- [azurerm_api_management](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management)
