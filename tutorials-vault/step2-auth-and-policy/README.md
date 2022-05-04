# Enable alternate auth method and set up the policy

In general, from scratch, the following steps will be performed

1. An admin user installs Vault and starts Vault server. This admin user will unseal Vault and use the default token authentication to log in.
2. This admin user enables other authentication methods and sets up policies for those authentication methods.
3. Then, when other users need to use Vault, they can use those authentication methods and they will have the access based on the associated policies.

We are following

1. [GitHub authentication](https://learn.hashicorp.com/tutorials/vault/getting-started-authentication?in=vault/getting-started#github-authentication)
2. [Policies](https://learn.hashicorp.com/tutorials/vault/getting-started-policies?in=vault/getting-started)

The following commands are for Bash.

## Start Vault server - main admin user

Server side

1. mkdir -p ./vault/data
2. vault server -config=config.hcl

Client side

1. export VAULT_ADDR='http://127.0.0.1:8200'
2. vault operator init
3. vault operator unseal [key_value]
4. vault login token=[token_value]

## Create policy - main admin user at client side

1. vault policy write -h
2. vault policy write my-policy ./policy.hcl
3. vault policy list
4. vault policy read default
5. vault policy read my-policy

## Update policy - main admin user at client side

1. vault policy write my-policy ./policy.hcl
2. vault policy read my-policy

## Enable GitHub auth method - main admin user at client side

1. vault auth enable github
2. vault write auth/github/config organization=[org_name]
   - You may need to disconnect from VPN.
3. vault write auth/github/map/teams/[org_team_name] value=default,my-policy
4. vault auth list
5. vault auth help github

## Enable target secrets path - main admin user at client side

1. vault secrets enable -path=kv kv
2. vault secrets list
3. vault kv put kv/hello target=world
4. vault kv get kv/hello
5. vault kv put kv/my-secret value="s3c(eT"
6. vault kv get kv/my-secret
7. vault kv list kv/

## Log in to Vault under a different user - user 1 at client side

1. unset VAULT_TOKEN
2. vault login -method=github token=[GitHub_access_token]
3. vault token lookup

## Test the policy - user 1 at client side

Denied

1. vault kv get kv/hello
2. vault kv put kv/my-secret value2="s3c(eT2"

Passed

1. vault kv get kv/my-secret
2. vault kv put kv/hello target2=world2

## Disable GitHub auth method - main admin user at client side

Log in as the main admin user again.

1. vault token revoke -mode path auth/github
2. vault auth disable github

## Seal Vault when no more operation is needed - main admin user at client side

1. vault operator seal

## Shutdown Vault server - main admin user at server side

1. Press Ctrl + C
2. If want to clean up, remove ./vault/data folder.

## References

- [login](https://www.vaultproject.io/docs/commands/login)
- [Authentication](https://www.vaultproject.io/docs/concepts/auth)
- [Tokens](https://www.vaultproject.io/docs/concepts/tokens)
- [GitHub Auth Method](https://www.vaultproject.io/docs/auth/github)
- [Policies](https://www.vaultproject.io/docs/concepts/policies)
