# Use Vault with Terraform and Packer

## Set up Vault

1. Follow [Use GitHub auth method](../step2-auth-and-policy/README.md).
2. Make sure that the auth method used later has access to the secrets defined at locals.pkr.hcl and at data.tf.

## Packer with Vault

We did the authentication via Azure CLI as described by [Azure CLI](https://www.packer.io/plugins/builders/azure#azure-cli). We follow

1. [vault Function](https://www.packer.io/docs/templates/hcl_templates/functions/contextual/vault)
2. [Local Values](https://www.packer.io/docs/templates/hcl_templates/locals)

Open a Bash. (It will be smoother if you are disconnected from VPN.)

Set up secrets at Vault

1. Log in to Vault. Use the auth method which has create + update + read access the target secrets.
2. vault secrets enable -path=kv kv
3. vault secrets list
4. vault kv put kv/tutorials/vault/rg-name resource-group-name=[target_name]
5. vault kv get kv/tutorials/vault/rg-name
6. vault kv list kv/
7. unset VAULT_TOKEN
8. Log in to Vault. Use the auth method which has read access to the target secrets.
9. export VAULT_TOKEN=[target_token_value]

Run Packer

1. Run "az account set --subscription <subscription_id_or_subscription_name>" to set correct subscription, and then "az account show" to find the tenant ID.
2. Make sure that the secrets defined at locals.pkr.hcl are already set at Vault.
3. Run "packer init ."
4. Run "packer fmt ."
5. Run "packer validate ."
6. Run "packer build .".
   - This may take a while.
   - If the provisioner is stuck, press Ctrl+C to cancel the build and start the clean-up flow.
7. The created image will be inside the specified resource group. You can see it on your Azure portal.

## Terraform with Vault

We did the authentication via Azure CLI as described by [Authenticating using the Azure CLI](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/guides/azure_cli). We follow

1. [Vault Provider](https://registry.terraform.io/providers/hashicorp/vault/latest/docs)
2. [Data sources - vault_generic_secret](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret)

Open a Bash. (It will be smoother if you are disconnected from VPN.)

Set up secrets at Vault

1. Log in to Vault. Use the auth method which has create + update + read access the target secrets.
2. vault secrets enable -path=kv kv
3. vault secrets list
4. vault kv put kv/tutorials/vault/tenant-id tenant-id=[target_id]
5. vault kv patch kv/tutorials/vault/rg-name resource-group-name=[target_resource_group_name]
6. vault kv patch kv/tutorials/vault/rg-location resource-group-location=[target_resource_group_location]
7. vault kv get kv/tutorials/vault/tenant-id
8. vault kv list kv/
9. unset VAULT_TOKEN
10. Log in to Vault. Use the auth method which has read access to the target secrets.
11. export VAULT_TOKEN=[target_token_value]

Run Terraform

1. Run "az account set --subscription <subscription_id_or_subscription_name>" to set correct subscription, and then "az account show" to find the tenant ID.
2. Update backend.conf. Make sure that the secrets defined at data.tf and at above are already set at Vault.
3. Run "terraform init -backend-config=backend.conf".
4. Run "terraform fmt --recursive" to auto format our .tf files.
5. Run "terraform validate" to validate our configuration.
6. Run "terraform plan -out main.tfplan" to see what will be provisioned.
7. Run "terraform apply main.tfplan" to do the provisioning.
8. Run "terraform show" to see the new state.
9. Run "terraform state list" to see the latest list of resources managed.
10. Run some output commands, e.g., "echo "$(terraform output lb_id)"", to verify the result.
11. Run "terraform plan -destroy -out main.destroy.tfplan" and "terraform apply main.destroy.tfplan" to clean up the resources.

## References

- [Inject Secrets into Terraform Using the Vault Provider](https://learn.hashicorp.com/tutorials/terraform/secrets-vault?in=vault/secrets-management)
- [Resources - vault_generic_secret](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_secret)
