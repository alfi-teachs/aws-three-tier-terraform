# Step 24 - Interview Questions & Project Explanation

## Objective

This document contains common interview questions and answers related to the AWS Three-Tier Infrastructure project. It will help you confidently explain your project during technical interviews.

---

# Project Summary

This project provisions a production-style AWS Three-Tier Infrastructure using Terraform.

The infrastructure includes:

- Custom VPC
- Public and Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- EC2 Instances
- Launch Template
- Auto Scaling Group
- Application Load Balancer
- Target Group
- HTTP Listener
- Amazon RDS MySQL
- Remote Terraform Backend (S3 + DynamoDB)

All resources are created using Infrastructure as Code (IaC) with Terraform.

---

# Explain Your Project

## Tell me about your project.

This project demonstrates how to deploy a production-style three-tier architecture on AWS using Terraform.

I created a custom VPC with public and private subnets across multiple Availability Zones. An Application Load Balancer distributes incoming traffic to EC2 instances managed by an Auto Scaling Group. The application servers run in private subnets, while Amazon RDS MySQL is deployed in private subnets for security. Terraform provisions all infrastructure, and the state is stored remotely in Amazon S3 with DynamoDB state locking.

---

# Terraform Questions

## What is Terraform?

Terraform is an Infrastructure as Code tool used to provision and manage cloud resources through configuration files.

---

## Why did you use Terraform?

Terraform allows infrastructure to be automated, version-controlled, reusable, and consistently deployed across environments.

---

## What is a Terraform State File?

The state file stores information about the infrastructure managed by Terraform and maps configuration to real AWS resources.

---

## Why store the state remotely?

A remote backend enables team collaboration, centralized state storage, versioning, and state locking.

---

## Why use DynamoDB?

DynamoDB provides state locking, preventing multiple users from making changes to the infrastructure at the same time.

---

# AWS Networking Questions

## Why did you create public and private subnets?

Public subnets host internet-facing resources like the Application Load Balancer and NAT Gateway.

Private subnets host EC2 instances and Amazon RDS to improve security.

---

## Why is the NAT Gateway required?

The NAT Gateway allows instances in private subnets to access the internet for updates and package installation without exposing them to inbound internet traffic.

---

## What is the purpose of Route Tables?

Route Tables determine how network traffic is routed between subnets, gateways, and external networks.

---

# Load Balancer Questions

## Why use an Application Load Balancer?

The Application Load Balancer distributes incoming traffic across multiple EC2 instances, improving availability and reliability.

---

## What is a Target Group?

A Target Group contains the backend EC2 instances that receive traffic from the Application Load Balancer.

---

## What is a Listener?

A Listener checks for incoming requests on a specified port and protocol, then forwards them to the appropriate Target Group.

---

# Auto Scaling Questions

## What is an Auto Scaling Group?

An Auto Scaling Group automatically launches, replaces, and terminates EC2 instances based on the configured capacity.

---

## Why use a Launch Template?

A Launch Template defines the configuration used to launch EC2 instances, including the AMI, instance type, security group, key pair, and user data.

---

# RDS Questions

## Why deploy Amazon RDS in private subnets?

Deploying Amazon RDS in private subnets prevents direct internet access and improves database security.

---

## What is a DB Subnet Group?

A DB Subnet Group specifies the private subnets where Amazon RDS can be deployed.

---

## Why use Amazon RDS instead of MySQL on EC2?

Amazon RDS is a managed database service that provides automated backups, patching, monitoring, and easier maintenance.

---

# Security Questions

## How is the infrastructure secured?

- Security Groups control inbound and outbound traffic.
- EC2 instances are deployed in private subnets.
- RDS is not publicly accessible.
- IAM controls access to AWS resources.
- Terraform state is encrypted in Amazon S3.

---

# Production Improvements

For a production environment, I would:

- Use HTTPS with ACM certificates.
- Configure Route 53 with a custom domain.
- Enable Multi-AZ for Amazon RDS.
- Store secrets in AWS Secrets Manager.
- Enable CloudWatch Alarms.
- Enable AWS WAF.
- Deploy the application using a CI/CD pipeline.
- Enable AWS Backup.
- Use AWS Systems Manager instead of SSH where appropriate.

---

# Challenges Faced

During this project I learned:

- Designing secure AWS networking.
- Creating reusable Terraform configurations.
- Configuring Auto Scaling and Load Balancers.
- Managing Terraform state remotely.
- Deploying a complete three-tier architecture using Infrastructure as Code.

---

# Key Skills Demonstrated

- AWS
- Terraform
- Linux
- Networking
- IAM
- EC2
- Auto Scaling
- Application Load Balancer
- Amazon RDS
- Infrastructure as Code
- Git & GitHub

---

# Conclusion

This project demonstrates how to build a scalable, secure, and highly available AWS infrastructure using Terraform. It follows Infrastructure as Code principles and incorporates networking, compute, load balancing, database deployment, and remote state management to reflect a production-oriented architecture.