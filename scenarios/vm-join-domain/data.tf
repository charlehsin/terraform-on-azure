data "azurerm_lb" "example" {
  name                = var.load_balancer_name
  resource_group_name = var.resource_group_name
}

data "azurerm_lb_backend_address_pool" "example" {
  name            = var.backend_address_pool_name
  loadbalancer_id = data.azurerm_lb.example.id
}
