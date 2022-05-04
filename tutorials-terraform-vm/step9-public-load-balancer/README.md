# Create Azure public load balancer in existing resource group

This creates an Azure public load balancer with health probes and load balancing rules in an existing resource group.

We did the authentication via Azure CLI as described by [Authenticating using the Azure CLI](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/guides/azure_cli). We follow

- [azurerm_lb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb)
- [azurerm_lb_probe](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_probe)
- [azurerm_lb_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_rule)
- [azurerm_lb_backend_address_pool_address](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_backend_address_pool_address)
- [azurerm_network_interface_backend_address_pool_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_backend_address_pool_association)

Open a Bash. (It will be smoother if you are disconnected from VPN.)

1. Run "az account set --subscription <subscription_id_or_subscription_name>" to set correct subscription, and then "az account show" to find the tenant ID.
2. Update secret.tfvars
3. Run "terraform init".
4. Run "terraform fmt --recursive" to auto format our .tf files.
5. Run "terraform validate" to validate our configuration.
6. Run "terraform plan -out main.tfplan -var-file=./secret.tfvars" to see what will be provisioned.
7. Run "terraform apply main.tfplan" to do the provisioning.
8. Run "terraform show" to see the new state.
9. Run "terraform state list" to see the latest list of resources managed.
10. Run some output commands, e.g., "echo "$(terraform output lb_id)"", to verify the result.
11. Run "terraform plan -destroy -out main.destroy.tfplan -var-file=./secret.tfvars" and "terraform apply main.destroy.tfplan" to clean up the resources.
