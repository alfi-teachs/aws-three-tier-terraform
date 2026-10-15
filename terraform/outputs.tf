output "project_name" {
  description = "name of the project"
  value       = var.project_name
}
output "environment" {
  description = "deployment environment"
  value       = var.environment
}
output "region" {
  description = "The AWS region to deploy resources"
  value       = var.region
}
output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.app.dns_name
}

output "alb_url" {
  description = "HTTP URL of the Application Load Balancer"
  value       = "http://${aws_lb.app.dns_name}"
}

