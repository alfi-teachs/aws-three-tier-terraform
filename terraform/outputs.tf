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
