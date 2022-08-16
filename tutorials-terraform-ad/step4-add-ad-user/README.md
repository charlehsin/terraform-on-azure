# Get started on using Terraform to create user in Azure Active Directory

Currently, Terraform has no support to create a tenant in AZure Active Directory. Follow [Quickstart: Create a new tenant in Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-access-create-new-tenant) to create a tenant manually.

We did the authentication via Azure CLI as described by [Authenticating using the Azure CLI](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/guides/azure_cli).

Open a Bash.

1. If you are behind corporate VPN, run "export HTTPS_PROXY=<proxy_https>" and "export HTTP_PROXY=<proxy_http>".
2. Run "az login --tenant yourdir.onmicrosoft.com --allow-no-subscriptions" to log in to your tenant.
3. Run "az account show" and "az account tenant list" to find the tenant ID you want to use.
4. Update secret.tfvars.
5. Run "terraform init".
6. Run "terraform fmt -recursive".
7. Run "terraform validate" to validate our configuration.
8. Run "terraform plan -out main.tfplan -var-file=./secret.tfvars" to see what will be provisioned.
9. Run "terraform apply main.tfplan" to do the provisioning.
10. Run "terraform show" to see the new state.
11. Run "terraform state list" to see the latest list of resources managed.
12. Run some output commands, e.g., "echo "$(terraform output id)"", to verify the result.
13. Run "terraform plan -destroy -out main.destroy.tfplan -var-file=./secret.tfvars" and "terraform apply main.destroy.tfplan" to clean up the resources.

## References

- [Resource: azuread_user](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/user)
