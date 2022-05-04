# Let Windows server VM join an existing domain by using modules

This creates a Windows server virtual machine in the existing infrastructure (existing resource group). This enables WinRM (via HTTP) on this virtual machine, then uploads some files, and then runs some remote commands. For the remote commands, we will use PowerShell scripts to do the following setups.

1. Install IIS.
2. Set up the DNS servers for the network adaptor so that the VM can talk to the ADDC and to the Azure DNS service.
3. Add the computer to the domain.
4. Delete the sensitive script file with credentials.  Note: This is just a temporary approach and should not be used in production. Need a more secure approach to handle the credentials.

Then this virtual machine is added to an existing load balancer.

We did the authentication via Azure CLI as described by [Authenticating using the Azure CLI](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/guides/azure_cli), and we will follow the following

- [Reuse Configuration with Modules](https://learn.hashicorp.com/collections/terraform/modules?utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS)
- [Write Terraform Configuration](https://learn.hashicorp.com/collections/terraform/configuration-language)
- [Terraform Language Documentation](https://www.terraform.io/language)
- [How To Structure a Terraform Project](https://www.digitalocean.com/community/tutorials/how-to-structure-a-terraform-project)
- [Backends](https://www.terraform.io/language/settings/backends)

Make sure your AD service is up and running, and your existing security group rule is set up so that WinRM port is open. Open a Bash. (It will be smoother if you are disconnected from VPN.)

1. Run "az account set --subscription <subscription_id_or_subscription_name>" to set correct subscription, and then "az account show" to find the tenant ID.
2. Update secret.tfvars and backend.conf. Also, update the following
   - At to_upload/setup/setup_netadaptor.ps1
      - The address of the ADDC.
      - The address ot the Azure DNS service for VMs.
   - At to_upload/setup/setup_join_domain.ps1
      - Domain name
      - Domain credential
3. Run "terraform init -backend-config=backend.conf".
4. Run "terraform fmt -recursive".
5. Run "terraform validate" to validate our configuration.
6. Run "terraform plan -out main.tfplan -var-file=./secret.tfvars" to see what will be provisioned.
7. Run "terraform apply main.tfplan" to do the provisioning.
8. Run "terraform show" to see the new state.
9. Run "terraform state list" to see the latest list of resources managed.
10. Run some output commands, e.g., "echo "$(terraform output virtual_machine_id)"", to verify the result.
11. Run "terraform plan -destroy -out main.destroy.tfplan -var-file=./secret.tfvars" and "terraform apply main.destroy.tfplan" to clean up the resources.
