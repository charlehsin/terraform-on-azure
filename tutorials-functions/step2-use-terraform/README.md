# Get started on using Terraform to deploy Azure Function App

This is based on the knowledge on top of "step1-ramp-up".  From that, we already have a dummy Function App in LocalFunctionProj folder. We will use Terraform to deploy Azure Function App. However, we will manually use Azure Functions Tools to upload Function files after Azure Function App is created.

We did the authentication via Azure CLI as described by [Authenticating using the Azure CLI](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/guides/azure_cli), and we will follow the following

- [Deploy Azure Functions with Terraform](https://www.maxivanov.io/deploy-azure-functions-with-terraform/)
- [azurerm_windows_function_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_function_app)
- [Quickstart: Create a JavaScript function in Azure from the command line](https://docs.microsoft.com/en-us/azure/azure-functions/create-first-function-cli-node?tabs=azure-cli%2Cbrowser)

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
12. Visit https://<your_function_name>.azurewebsites.net/ to check that it is up and running.
13. Go to LocalFunctionProj folder, and run "func azure functionapp publish <APP_NAME>".
14. Visit target url path, https://<your_function_name>.azurewebsites.net/api/HttpExample, to check that it is up and running.
15. Go back from LocalFUnctionProj folder.
16. Run "terraform plan -destroy -out main.destroy.tfplan -var-file=./secret.tfvars" and "terraform apply main.destroy.tfplan" to clean up the resources.

## Reference

- [azurerm_service_plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan)
- [Server farm (service plan) SKUs](https://stackoverflow.com/questions/47522539/server-farm-service-plan-skus)
- [azurerm_application_insights](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights)
- [azurerm_linux_function_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_function_app)
- [azurerm_windows_function_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_function_app)
- [The lifecycle Meta-Argument](https://www.terraform.io/language/meta-arguments/lifecycle)
