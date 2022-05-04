locals {
  image_resource_group_name = vault("/kv/tutorials/vault/rg-name", "resource-group-name")
}
