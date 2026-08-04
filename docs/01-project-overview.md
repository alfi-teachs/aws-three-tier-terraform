# Project Overview

## Project Name

AWS Three-Tier Infrastructure using Terraform

---

# Introduction

This project demonstrates how to provision a production-ready three-tier infrastructure on Amazon Web Services (AWS) using Terraform.

The infrastructure is built following Infrastructure as Code (IaC) principles, allowing cloud resources to be created, updated, and managed through code instead of manual configuration.

The project is designed to simulate a real-world production environment by implementing secure networking, scalable compute resources, load balancing, database services, and Terraform state management.

---

# Project Objectives

The primary objectives of this project are to:

- Learn Infrastructure as Code (IaC) using Terraform.
- Build a production-style AWS network architecture.
- Deploy scalable and highly available web servers.
- Configure secure networking using public and private subnets.
- Implement an Application Load Balancer (ALB).
- Deploy an Amazon RDS database.
- Configure Terraform remote state using Amazon S3 and DynamoDB.
- Follow AWS and Terraform best practices.

---

# Architecture

```
                      Internet
                          │
                    Route 53 (Optional)
                          │
              Application Load Balancer
                          │
          ┌───────────────┴───────────────┐
          │                               │
    Public Subnet A                 Public Subnet B
          │                               │
          └───────────────┬───────────────┘
                          │
                 Auto Scaling Group
                          │
                 EC2 Web Servers
                          │
          ┌───────────────┴───────────────┐
          │                               │
    Private Subnet A                Private Subnet B
          │                               │
          └───────────────┬───────────────┘
                          │
                     Amazon RDS
```

---

# AWS Services Used

- Amazon VPC
- Public Subnets
- Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- Amazon EC2
- Application Load Balancer (ALB)
- Auto Scaling Group (ASG)
- Amazon RDS
- AWS Identity and Access Management (IAM)
- Amazon S3
- Amazon DynamoDB

---

# Tools Used

- Terraform
- AWS CLI
- Git
- GitHub
- Visual Studio Code

---

# Project Structure

```
aws-three-tier-terraform/

├── docs/
├── modules/
├── screenshots/

├── provider.tf
├── versions.tf
├── variables.tf
├── terraform.tfvars

├── vpc.tf
├── subnet.tf
├── igw.tf
├── nat.tf
├── route-table.tf
├── security-group.tf
├── ec2.tf
├── alb.tf
├── autoscaling.tf
├── rds.tf

├── backend.tf
├── outputs.tf
├── user-data.sh

└── README.md
```

---

# Skills Demonstrated

This project demonstrates practical experience with:

- Infrastructure as Code (IaC)
- AWS Networking
- Terraform
- Linux
- Cloud Security
- High Availability
- Load Balancing
- Auto Scaling
- Amazon RDS
- Git Version Control

---

# Learning Outcomes

After completing this project, you will understand how to:

- Design AWS networking architecture.
- Create reusable Terraform configurations.
- Provision AWS resources using Infrastructure as Code.
- Build scalable and highly available infrastructure.
- Deploy secure production workloads.
- Store Terraform state remotely.
- Follow Terraform and AWS best practices.

---

# Project Status

🚧 In Progress

Current Phase:

- ✅ Project Planning
- ✅ Repository Setup
- ⏳ Terraform Configuration
- ⏳ Networking
- ⏳ Compute
- ⏳ Database
- ⏳ Testing
- ⏳ Documentation