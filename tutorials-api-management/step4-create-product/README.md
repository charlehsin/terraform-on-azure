# Get started on using Terraform to create an API product

This is based on the knowledge on top of "step3-import-api". We will use an existing API in an existing API Management instance. We will create an API product and add the existing API into this product.

We did the authentication via Azure CLI as described by [Authenticating using the Azure CLI](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/guides/azure_cli), and we will follow the following

- [azurerm_api_management_product](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product)
- [azurerm_api_management_product_api](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product_api)
- [Tutorial: Create and publish a product](https://docs.microsoft.com/en-us/azure/api-management/api-management-howto-add-products?tabs=azure-portal)

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
11. Run some output commands, e.g., "echo "$(terraform output product_id)"", to verify the result.
12. Run "terraform plan -destroy -out main.destroy.tfplan -var-file=./secret.tfvars" and "terraform apply main.destroy.tfplan" to clean up the resources.

## References

- [azurerm_api_management](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management)
- [Data Source: azurerm_api_management](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/api_management)
- [azurerm_api_management_api](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api)
- [Data Source: azurerm_api_management_api](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/api_management_api)
- [azurerm_api_management_product](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product)
- [azurerm_api_management_product_api](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product_api)
