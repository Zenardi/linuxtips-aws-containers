output "load_balancer_dns" {
  value = aws_lb.main.dns_name
}

output "lb_ssm_arn" {
  value = aws_ssm_parameter.lb_arn.id
}

output "lb_ssm_listener" {
  value = aws_lb_listener.main.id
}

output "cloudmap_ssm" {
  description = "ID do namespace de Service Discovery do Cluster"
  value       = aws_ssm_parameter.cloudmap.id
}

output "service_connect_ssm" {
  description = "ID do Namespace de Service Connect do Cluster"
  value       = aws_ssm_parameter.service_connect.id
}

output "service_connect_name_ssm" {
  description = "Nome do Service Connect do Cluster"
  value       = aws_ssm_parameter.service_connect_name.id
}