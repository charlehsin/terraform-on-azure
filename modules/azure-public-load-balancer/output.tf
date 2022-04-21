output "lb_id" {
  description = "ID of the load balancer."
  value       = azurerm_lb.lb.id
}

output "lb_frontend_ip_config" {
  description = "Frontend IP configuration of the load balancer."
  value       = azurerm_lb.lb.frontend_ip_configuration
}

output "backend_address_pool_id" {
  description = "ID of the backend address pool."
  value       = azurerm_lb_backend_address_pool.lb_backend_pool.id
}
