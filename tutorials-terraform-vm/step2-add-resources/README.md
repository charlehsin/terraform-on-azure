# Add a resource into the resource group

This is the 2nd step to add a resource into the resource group. This also practices the following

- Modify the managed asset in Azure directly, and let Terraform to reset it back based on the plan.
- Modify the terraform file and replan + reapply it, and check the changes.

We did the authentication via Azure CLI as described by [Authenticating using the Azure CLI](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/guides/azure_cli), and we will follow [Change Infrastructure](https://learn.hashicorp.com/tutorials/terraform/azure-change?in=terraform/azure-get-started).

This is based on top of the terraform files in "step_1_create_resource_group".

Open a Bash.

1. If you are behind corporate VPN, run "export HTTPS_PROXY=<proxy_https>" and "export HTTP_PROXY=<proxy_http>".
2. Run "az account show" to find the tenant ID.
3. Check the main.tf, variables.tf, and output.tf files. Update the tenant ID at variables.tf.
4. Run "terraform init". If you are using VPN and your proxies are not set up correctly, you may need to disconnect from VPN.
5. Run "terraform fmt" to auto format our .tf files.
6. Run "terraform validate" to validate our configuration.
7. Run "terraform plan -out main.tfplan" to see what will be provisioned.
8. Run "terraform apply main.tfplan" to do the provisioning.
9. Run the following to verify the result.
   - "echo "$(terraform output resource_group_name)""
   - "echo "$(terraform output resource_group_id)""
10. Run "az group show --name <resource_group_name>" to verify the result.
11. Delete the newly-created virtual network at Azure console directly. Then, if you run "terraform refresh", it will update the terraform state. Then, if you run "terraform show", it will show the current state where the virtual network is not created. Then, if you run the same "plan" and "apply" commands as above, the virtual network will be recreated again.
12. Update some terraform files, e.g., main.tf to add tags. Then, if you run the same "plan" and "apply" commands as above, the new changes will be applied. Then, you can run "terraform show" to see the new state.
13. Run "terraform state list" to see the latest list of resources managed.
14. Run "terraform plan -destroy -out main.destroy.tfplan" and "terraform apply main.destroy.tfplan" to clean up the resources.
