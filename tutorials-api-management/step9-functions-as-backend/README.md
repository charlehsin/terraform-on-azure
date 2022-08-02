# Get started on using Terraform to use Functions App as the backend

This is based on the knowledge on top of "tutorials-functions" and "step2-create-instance". We will use an existing API Management instance.

We did the authentication via Azure CLI as described by [Authenticating using the Azure CLI](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/guides/azure_cli), and we will follow the following

1. Use [Quickstart: Create a JavaScript function in Azure from the command line](https://docs.microsoft.com/en-us/azure/azure-functions/create-first-function-cli-node?tabs=azure-cli%2Cbrowser) to create the basic Functions App using JavaScript. Then modify the [codes](./LocalFunctionProj/HttpExample/index.js) and the [configuration](./LocalFunctionProj/HttpExample/function.json) to handle a dummy GET request, and to change authLevel from Anonymous to function.
2. Read [Securing Azure Functions](https://docs.microsoft.com/en-us/azure/azure-functions/security-concepts?tabs=v4) and [API key authorization](https://docs.microsoft.com/en-us/azure/azure-functions/functions-bindings-http-webhook-trigger?tabs=in-process%2Cfunctionsv2&pivots=programming-language-javascript#api-key-authorization) to understand Functions access keys.
3. Read [Use named values in Azure API Management policies](https://docs.microsoft.com/en-us/azure/api-management/api-management-howto-properties?tabs=azure-portal) to understand how to use named values to store Functions access keys securely to be used by the API Management.
4. Read [Import an Azure Function App as an API in Azure API Management](https://docs.microsoft.com/en-us/azure/api-management/import-function-app-as-api) to understand the overview.

In the terraform codes, the following steps are done

1. Assumptions:
   - Functions App's local codes are created already.
   - API Management instance is created already.
   - An OpenAPI spec file (matching Functions App's codes and the to-be-created API properties) is created already.
2. Create Functions App
   1. Create a new storage account and upload Functions App's codes to the storage account.
   2. Create a service plan, and then create Functions app to use the codes in the storage account.
3. Get the access key from Functions app.
4. Create a named value for the API Management to store the access key.
5. Create an API in the API Management instance by importing the OpenAPI spec.
6. Create an API backend by using Functions App and the named value storing the access key.
7. Create an API policy to set the backend.

Basically, the request to <https://<api_management_name>.azure-api.net/<api_path>/> will be forwarded to <https://<function_default_hostname>/api/>. The API Management will insert Functions APP's host key in the request header for Functions App to accept this request.

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
11. Run some output commands, e.g., "echo "$(terraform output api_id)"", to verify the result.
12. Run "terraform plan -destroy -out main.destroy.tfplan -var-file=./secret.tfvars" and "terraform apply main.destroy.tfplan" to clean up the resources.

## References

- [azurerm_api_management](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management)
- [Data Source: azurerm_api_management](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/api_management)
- [azurerm_api_management_api](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api)
- [Data Source: azurerm_api_management_api](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/api_management_api)
- [azurerm_api_management_product](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product)
- [azurerm_api_management_product_api](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product_api)
- [azurerm_api_management_api_operation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_operation)
- [azurerm_api_management_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_policy)
- [azurerm_api_management_api_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_policy)
- [azurerm_api_management_api_operation_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_operation_policy)
- [azurerm_api_management_api_version_set](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set)
- [azurerm_api_management_named_value](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_named_value)
- [azurerm_api_management_backend](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_backend)
- [Data Source: azurerm_function_app_host_keys](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/function_app_host_keys)
- [String Interpolation](https://www.terraform.io/language/expressions/strings#interpolation)
