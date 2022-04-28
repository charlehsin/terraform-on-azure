output "lb_id" {
  description = "ID of the load balancer."
  value       = module.public_load_balancer.lb_id
}

output "lb_frontend_ip_config" {
  description = "Frontend IP configuration of the load balancer."
  value       = module.public_load_balancer.lb_frontend_ip_config
}
