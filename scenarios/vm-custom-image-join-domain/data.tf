data "azurerm_lb" "example" {
  name                = var.load_balancer_name
  resource_group_name = var.resource_group_name
}

data "azurerm_lb_backend_address_pool" "example" {
  name            = var.backend_address_pool_name
  loadbalancer_id = data.azurerm_lb.example.id
}

data "azurerm_network_security_group" "example" {
  name                = var.security_group_name
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "example" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}
