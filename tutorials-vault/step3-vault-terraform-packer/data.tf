data "vault_generic_secret" "tutorials_vault_tenant-id" {
  path = "kv/tutorials/vault/tenant-id"
}

data "vault_generic_secret" "tutorials_vault_rg-name" {
  path = "kv/tutorials/vault/rg-name"
}

data "vault_generic_secret" "tutorials_vault_rg-location" {
  path = "kv/tutorials/vault/rg-location"
}
