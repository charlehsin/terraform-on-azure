# Create a VM with custom image

This creates a virtual machine, using a custom image, in the existing infrastructure (existing resource group). Then this virtual machine is added to an existing load balancer.

The custom images may have setup scripts that one can use to do further setup. This will not use Terraform WinRM.

We did the authentication via Azure CLI as described by [Authenticating using the Azure CLI](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/guides/azure_cli), and we will follow the following

- [Reuse Configuration with Modules](https://learn.hashicorp.com/collections/terraform/modules?utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS)
- [Write Terraform Configuration](https://learn.hashicorp.com/collections/terraform/configuration-language)
- [Terraform Language Documentation](https://www.terraform.io/language)
- [How To Structure a Terraform Project](https://www.digitalocean.com/community/tutorials/how-to-structure-a-terraform-project)

Open a Bash. (It will be smoother if you are disconnected from VPN.)

1. Run "az account set --subscription <subscription_id_or_subscription_name>" to set correct subscription, and then "az account show" to find the tenant ID.
2. Check secret.tfvars file and update the values.
3. Run "terraform init".
4. Run "terraform fmt -recursive".
5. Run "terraform validate" to validate our configuration.
6. Run "terraform plan -out main.tfplan -var-file=./secret.tfvars" to see what will be provisioned.
7. Run "terraform apply main.tfplan" to do the provisioning.
8. Run "terraform show" to see the new state.
9. Run "terraform state list" to see the latest list of resources managed.
10. Run some output commands, e.g., "echo "$(terraform output virtual_machine_id)"", to verify the result.
11. Run "terraform plan -destroy -out main.destroy.tfplan -var-file=./secret.tfvars" and "terraform apply main.destroy.tfplan" to clean up the resources.
