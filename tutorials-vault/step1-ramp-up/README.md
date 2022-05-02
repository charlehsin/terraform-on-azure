# Get started on Vault

This is just a list of web posts to ramp up on Vault. We are following

1. [Getting Started](https://learn.hashicorp.com/collections/vault/getting-started)

## Useful commands on Bash to start Vault server and to test at Vault client

- vault

Server side

- vault server -dev

Client side

- export VAULT_ADDR='http://127.0.0.1:8200'
- export VAULT_TOKEN="root_token_value"
- vault status

## Useful commands on Bash to create secrets at server side

- vault kv put -help
- vault kv put secret/hello foo=world
- vault kv put secret/hello foo=world excited=yes
- vault kv get secret/hello
- vault kv get -field=excited secret/hello
- vault kv delete secret/hello
- vault kv undelete -versions=2 secret/hello

## Useful commands on Bash to enable secret engine at server side

- vault secrets enable -path=kv kv
- vault secrets list
- vault kv put kv/hello target=world
- vault kv get kv/hello
- vault kv put kv/my-secret value="s3c(eT"
- vault kv get kv/my-secret
- vault kv delete kv/my-secret
- vault kv list kv/
- vault secrets disable kv/

## Useful commands on Bash to deploy production Vault server

Server side

- mkdir -p ./vault/data
- vault server -config=config.hcl

Client side

- export VAULT_ADDR='http://127.0.0.1:8200'
- vault operator init
- vault operator unseal
- vault login
- vault operator seal

## References

- [Vault by HashiCorp](https://www.vaultproject.io/)
