# Get started on using Terraform to publish Azure Function App

This is based on the knowledge on top of "step2-use-terraform". In that tutorial, we only create the Function App via Terraform, but we upload the Function App code/file manually. In this tutorial, we will use Terraform to upload Function files via Blob storage after Azure Function App is created.

We did the authentication via Azure CLI as described by [Authenticating using the Azure CLI](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/guides/azure_cli), and we will follow the following

- [Publish Azure Functions code with Terraform](https://www.maxivanov.io/publish-azure-functions-code-with-terraform/)

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
11. Run some output commands, e.g., "echo "$(terraform output storage_account_id)"", to verify the result.
12. Visit target url path, https://<your_function_name>.azurewebsites.net/api/HttpExample, to check that it is up and running.
13. Go back from LocalFUnctionProj folder.
14. Run "terraform plan -destroy -out main.destroy.tfplan -var-file=./secret.tfvars" and "terraform apply main.destroy.tfplan" to clean up the resources.

## References

- [archive_file](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/archive_file)
- [azurerm_storage_blob](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_blob)
- [Data Source: azurerm_storage_account_blob_container_sas](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account_blob_container_sas)
- [timestamp Function](https://www.terraform.io/language/functions/timestamp)
