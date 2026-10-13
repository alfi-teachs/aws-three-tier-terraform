variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "aws-three-tier"
}
variable "environment" {
  description = "deployment environment"
  type        = string
  default     = "dev"
}
variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}
