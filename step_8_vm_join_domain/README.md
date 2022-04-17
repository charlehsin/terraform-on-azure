# Create a Windows VM in an existing subnet and join an existing domain

This is the 8th step to create a Windows VM in an existing subnet and to join an existing domain.

We did the authentication via Azure CLI as described by [Authenticating using the Azure CLI](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/guides/azure_cli), and we will follow the following

- []()

This is based on top of the terraform files in "step_7_upload_directories_to_vm".

Open a Bash. (It will be smoother if you are disconnected from VPN.)

1. Run "az account show" to find the tenant ID.
2. Check the main.tf, variables.tf, and output.tf files. Update the tenant ID at variables.tf. Update the VM account and password at variables.tf. Update the storage account uri at variables.tf.
3. Run "terraform init".
4. Run "terraform fmt" to auto format our .tf files.
5. Run "terraform validate" to validate our configuration.
6. Run "terraform plan -out main.tfplan" to see what will be provisioned.
7. Run "terraform apply main.tfplan" to do the provisioning.
8. Run "terraform show" to see the new state.
9. Run "terraform state list" to see the latest list of resources managed.
10. Run some output commands, e.g., "echo "$(terraform output resource_group_name)"", to verify the result.
11. Run "terraform plan -destroy -out main.destroy.tfplan" and "terraform apply main.destroy.tfplan" to clean up the resources.
