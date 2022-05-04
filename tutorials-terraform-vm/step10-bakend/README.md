# Use Terraform Backend to create Azure public load balancer in existing resource group

This uses Terraform Backend to create an Azure public load balancer with health probes and load balancing rules in an existing resource group.

We did the authentication via Azure CLI as described by [Authenticating using the Azure CLI](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/guides/azure_cli). We follow the previous step and the following

- [Backends](https://www.terraform.io/language/settings/backends)
- [azurerm](https://www.terraform.io/language/settings/backends/azurerm)

Open a Bash. (It will be smoother if you are disconnected from VPN.)

1. Run "az account set --subscription <subscription_id_or_subscription_name>" to set correct subscription, and then "az account show" to find the tenant ID.
2. Update secret.tfvars and backend.conf.
3. Run "terraform init -backend-config=backend.conf".
4. Run "terraform fmt --recursive" to auto format our .tf files.
5. Run "terraform validate" to validate our configuration.
6. Run "terraform plan -out main.tfplan -var-file=./secret.tfvars" to see what will be provisioned.
7. Run "terraform apply main.tfplan" to do the provisioning.
8. Run "terraform show" to see the new state.
9. Run "terraform state list" to see the latest list of resources managed.
10. Run some output commands, e.g., "echo "$(terraform output lb_id)"", to verify the result.
11. Run "terraform plan -destroy -out main.destroy.tfplan -var-file=./secret.tfvars" and "terraform apply main.destroy.tfplan" to clean up the resources.
