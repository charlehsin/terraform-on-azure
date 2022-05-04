# Dev servers have version 2 of KV secrets engine mounted by default, so will
# need these paths to grant permissions:
# With this policy, a user could write any secret to secret/data/, except to secret/data/foo, where only read access is allowed.
# Policies default to deny, so any access to an unspecified path is not allowed.
path "kv/*" {
  capabilities = ["create", "update"]
}

path "kv/my-secret" {
  capabilities = ["read"]
}