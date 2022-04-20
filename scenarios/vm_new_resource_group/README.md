# Modify step_7 codes to use module structure

This ???

We did the authentication via Azure CLI as described by [Authenticating using the Azure CLI](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/guides/azure_cli), and we will follow the following

- [Reuse Configuration with Modules](https://learn.hashicorp.com/collections/terraform/modules?utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS)
- [Write Terraform Configuration](https://learn.hashicorp.com/collections/terraform/configuration-language)
- [Terraform Language Documentation](https://www.terraform.io/language)
- [How To Structure a Terraform Project](https://www.digitalocean.com/community/tutorials/how-to-structure-a-terraform-project)

Open a Bash. (It will be smoother if you are disconnected from VPN.)

1. Run "az account show" to find the tenant ID.
2. Check the ???. Update the ??? at ???.
3. Run "terraform init".
4. Run "terraform fmt -recursive".
5. Run "terraform validate" to validate our configuration.
