resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = var.public_ip_allocation_method
  sku                 = var.public_ip_sku
  sku_tier            = "Regional"
  domain_name_label   = var.public_ip_domain_name_label
}

resource "azurerm_lb" "lb" {
  name                = var.load_balancer_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = var.load_balancer_sku
  sku_tier            = "Regional"

  frontend_ip_configuration {
    name                 = var.frontend_ip_config_name
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "lb_backend_pool" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = var.backend_address_pool_name
}

resource "azurerm_lb_probe" "lb_probe" {
  loadbalancer_id     = azurerm_lb.lb.id
  for_each            = var.lb_applications
  name                = "health-probe-${each.key}"
  protocol            = each.value["protocol"]
  port                = each.value["probe_port"]
  interval_in_seconds = each.value["probe_interval_in_seconds"]
  number_of_probes    = each.value["number_of_probes"]
}

resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id                = azurerm_lb.lb.id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.lb_backend_pool.id]
  frontend_ip_configuration_name = var.frontend_ip_config_name
  disable_outbound_snat          = true
  for_each                       = var.lb_applications
  name                           = "lb-rule-${each.key}"
  protocol                       = each.value["protocol"]
  frontend_port                  = each.value["frontend_port"]
  backend_port                   = each.value["backend_port"]
  probe_id                       = azurerm_lb_probe.lb_probe[each.key].id
  load_distribution              = each.value["session_persistence"]
}
