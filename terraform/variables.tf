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
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}
variable "public_subnet_1" {
  description = "The CIDR block for the public subnet 1"
  type        = string
  default     = "10.0.1.0/24"
}
variable "public_subnet_2" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}
variable "private_subnet_1" {
  description = "The CIDR block for the private subnet 1"
  type        = string
  default     = "10.0.11.0/24"
}
variable "private_subnet_2" {
  description = "The CIDR block for the private subnet 2"
  type        = string
  default     = "10.0.12.0/24"
}
variable "private_db_subnet_1" {
  description = "The CIDR block for the private database subnet 1"
  type        = string
  default     = "10.0.21.0/24"
}
variable "private_db_subnet_2" {
  description = "The CIDR block for the private database subnet 2"
  type        = string
  default     = "10.0.22.0/24"
}
variable "app_port" {
  description = "port on which application runs"
  type        = number
  default     = 3000
}
variable "db_port" {
  description = "Port used by the MySQL database"
  type        = number
  default     = 3306
}