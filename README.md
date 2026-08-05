# AWS Three-Tier Infrastructure using Terraform

## Project Overview

This project demonstrates how to provision a production-style AWS Three-Tier Infrastructure using Terraform.

The infrastructure follows Infrastructure as Code (IaC) best practices and includes networking, compute, load balancing, database, and remote state management.
```bash
# Phase 1 - Project Setup
──────────────────────────────────────────
✅ 01 Project Overview
✅ 02 Prerequisites
✅ 03 Terraform Setup

# Phase 2 - Networking
──────────────────────────────────────────
✅ 04 VPC
✅ 05 Public & Private Subnets
✅ 06 Internet Gateway
✅ 07 Route Tables
✅ 08 NAT Gateway
✅ 09 Security Groups

# Phase 3 - Compute
──────────────────────────────────────────
✅ 10 EC2 Instances

⬜ 11 Application Load Balancer
⬜ 12 Target Group
⬜ 13 Listener
⬜ 14 Launch Template
⬜ 15 Auto Scaling Group

# Phase 4 - Database
──────────────────────────────────────────
⬜ 16 RDS
⬜ 17 DB Subnet Group

# Phase 5 - Terraform
──────────────────────────────────────────
⬜ 18 Outputs
⬜ 19 Remote Backend (S3 + DynamoDB)

# Phase 6 - Validation
──────────────────────────────────────────
⬜ 20 Testing
⬜ 21 Cleanup
⬜ 22 GitHub Documentation
```
---

# Architecture

```
                 Internet
                     │
                Route 53 (Optional)
                     │
        Application Load Balancer
                     │
        ┌────────────┴────────────┐
        │                         │
   Public Subnet A          Public Subnet B
        │                         │
        └────────────┬────────────┘
                     │
          Auto Scaling Group
                     │
          EC2 Web Servers (Apache)
                     │
        ┌────────────┴────────────┐
        │                         │
 Private Subnet A          Private Subnet B
        │                         │
        └────────────┬────────────┘
                     │
                  RDS MySQL
```

---

# AWS Services Used

- VPC
- Public Subnets
- Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- EC2
- Application Load Balancer (ALB)
- Auto Scaling Group (ASG)
- Amazon RDS
- IAM
- Amazon S3 (Terraform Remote State)
- DynamoDB (Terraform State Locking)

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

├── backend.tf
├── provider.tf
├── versions.tf
├── variables.tf
├── terraform.tfvars

├── main.tf

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

├── outputs.tf

├── user-data.sh

├── README.md

├── modules/

└── screenshots/
```

---

# Project Roadmap

| Step | Description | Status |
|------|-------------|--------|
| 1 | Create GitHub Repository | ✅ |
| 2 | Create Project Structure | ✅ |
| 3 | Project Planning & Architecture | ✅ |
| 4 | Configure Terraform | ⏳ |
| 5 | Create VPC | ⏳ |
| 6 | Create Public Subnets | ⏳ |
| 7 | Create Private Subnets | ⏳ |
| 8 | Internet Gateway | ⏳ |
| 9 | NAT Gateway | ⏳ |
| 10 | Route Tables | ⏳ |
| 11 | Security Groups | ⏳ |
| 12 | Launch Template | ⏳ |
| 13 | Auto Scaling Group | ⏳ |
| 14 | Application Load Balancer | ⏳ |
| 15 | Amazon RDS | ⏳ |
| 16 | Outputs | ⏳ |
| 17 | Remote Backend (S3 + DynamoDB) | ⏳ |
| 18 | Deploy Infrastructure | ⏳ |
| 19 | Testing | ⏳ |
| 20 | Cleanup | ⏳ |

---

# Prerequisites

Before starting this project, ensure the following tools are installed:

- Terraform
- AWS CLI
- Git
- Visual Studio Code

AWS Requirements:

- AWS Account
- IAM User with appropriate permissions
- AWS CLI configured (`aws configure`)

---

# Learning Objectives

By completing this project, you will learn how to:

- Provision AWS infrastructure using Terraform
- Design a production-ready VPC
- Configure Public and Private Subnets
- Configure Internet and NAT Gateways
- Create Route Tables
- Configure Security Groups
- Deploy EC2 instances
- Create an Application Load Balancer
- Configure an Auto Scaling Group
- Deploy an Amazon RDS database
- Store Terraform state remotely in Amazon S3
- Lock Terraform state using DynamoDB
- Follow Infrastructure as Code (IaC) best practices

---

# Progress

- [x] Repository Created
- [x] Project Structure Created
- [x] Architecture Designed
- [ ] Terraform Configuration
- [ ] VPC
- [ ] Subnets
- [ ] Internet Gateway
- [ ] NAT Gateway
- [ ] Route Tables
- [ ] Security Groups
- [ ] EC2
- [ ] Auto Scaling
- [ ] Application Load Balancer
- [ ] RDS
- [ ] Remote Backend
- [ ] Deployment
- [ ] Testing
- [ ] Documentation
