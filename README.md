# AWS Three-Tier Infrastructure using Terraform

## 📖 Project Overview

This project demonstrates how to provision a production-ready AWS Three-Tier Infrastructure using Terraform.

The infrastructure follows Infrastructure as Code (IaC) best practices and automates the deployment of networking, compute, load balancing, database, and remote state management.

The architecture is designed to be secure, scalable, and highly available using AWS networking services, Auto Scaling Groups, Application Load Balancer, and Amazon RDS.

---

# 🏗️ Architecture

```text
                    Internet
                        │
                 Route 53 (Optional)
                        │
            Application Load Balancer
                        │
                 HTTP Listener (80)
                        │
                  Target Group
                        │
              Auto Scaling Group
             ┌──────────┴──────────┐
             │                     │
        EC2 Instance 1       EC2 Instance 2
       Private Subnet A     Private Subnet B
             │                     │
             └──────────┬──────────┘
                        │
                  Amazon RDS MySQL
```

---

# 🚀 Features

- Infrastructure as Code (IaC) using Terraform
- Production-style AWS Three-Tier Architecture
- Custom VPC
- Public & Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- EC2 Instances
- Application Load Balancer (ALB)
- Target Group
- HTTP Listener
- Launch Template
- Auto Scaling Group (ASG)
- Amazon RDS MySQL
- Remote Terraform State using Amazon S3
- Terraform State Locking using DynamoDB
- Step-by-step documentation
- Deployment screenshots
- Infrastructure cleanup guide

---

# ☁️ AWS Services Used

- Amazon VPC
- Public Subnets
- Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- Amazon EC2
- Application Load Balancer (ALB)
- Target Group
- Auto Scaling Group (ASG)
- Amazon RDS MySQL
- IAM
- Amazon S3
- DynamoDB

---

# 🛠️ Tools Used

- Terraform
- AWS CLI
- Git
- GitHub
- Visual Studio Code

---

# 📁 Project Structure

```text
aws-three-tier-terraform/
│
├── docs/
│   ├── 01-project-overview.md
│   ├── 02-prerequisites.md
│   ├── 03-terraform-setup.md
│   ├── 04-create-vpc.md
│   ├── 05-create-subnets.md
│   ├── 06-create-internet-gateway.md
│   ├── 07-create-route-tables.md
│   ├── 08-create-nat-gateway.md
│   ├── 09-create-security-groups.md
│   ├── 10-create-ec2.md
│   ├── 11-create-load-balancer.md
│   ├── 12-create-target-group.md
│   ├── 13-create-listener.md
│   ├── 14-create-launch-template.md
│   ├── 15-create-auto-scaling-group.md
│   ├── 16-create-rds.md
│   ├── 17-create-rds-security-group.md
│   ├── 18-create-rds-instance.md
│   ├── 19-terraform-outputs.md
│   ├── 20-remote-backend.md
│   ├── 21-testing-validation.md
│   └── 22-cleanup.md
│
├── screenshots/
│
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
└── .gitignore
```

---

# 📚 Project Roadmap

| Phase | Description | Status |
|------|-------------|:------:|
| Phase 1 | Project Setup | ✅ |
| Phase 2 | Networking | ✅ |
| Phase 3 | Compute | ✅ |
| Phase 4 | Database | ✅ |
| Phase 5 | Terraform Best Practices | ✅ |
| Phase 6 | Testing & Validation | ✅ |
| Phase 7 | Documentation | 🚧 |

---

# ✅ Prerequisites

Install the following tools before starting the project:

- Terraform
- AWS CLI
- Git
- Visual Studio Code

### AWS Requirements

- AWS Account
- IAM User with Administrator Access (for lab purposes)
- AWS CLI configured

```bash
aws configure
```

Verify Terraform installation:

```bash
terraform version
```

Verify AWS CLI:

```bash
aws sts get-caller-identity
```

---

# 🎯 Learning Objectives

By completing this project, you will learn how to:

- Build a production-style AWS infrastructure
- Design a secure VPC architecture
- Configure public and private subnets
- Deploy Internet Gateway and NAT Gateway
- Create Route Tables
- Configure Security Groups
- Launch EC2 instances
- Configure an Application Load Balancer
- Create Target Groups and Listeners
- Build Launch Templates
- Configure Auto Scaling Groups
- Deploy Amazon RDS in private subnets
- Store Terraform state remotely in Amazon S3
- Lock Terraform state using DynamoDB
- Validate infrastructure deployments
- Clean up AWS resources safely

---

# 📊 Project Progress

| Component | Status |
|-----------|:------:|
| Project Setup | ✅ |
| Terraform Configuration | ✅ |
| VPC | ✅ |
| Public Subnets | ✅ |
| Private Subnets | ✅ |
| Internet Gateway | ✅ |
| NAT Gateway | ✅ |
| Route Tables | ✅ |
| Security Groups | ✅ |
| EC2 Instances | ✅ |
| Application Load Balancer | ✅ |
| Target Group | ✅ |
| HTTP Listener | ✅ |
| Launch Template | ✅ |
| Auto Scaling Group | ✅ |
| DB Subnet Group | ✅ |
| RDS Security Group | ✅ |
| Amazon RDS | ✅ |
| Terraform Outputs | ✅ |
| Remote Backend | ✅ |
| Testing & Validation | ✅ |
| Cleanup | ✅ |
| Documentation | 🚧 |

---

# 📸 Screenshots

The deployment screenshots are available in the **screenshots/** directory.

Examples include:

- VPC
- Public & Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- EC2 Instances
- Application Load Balancer
- Target Group
- Auto Scaling Group
- Amazon RDS
- Terraform Outputs
- Successful Application Deployment

---

# 🧹 Cleanup

To remove all infrastructure:

```bash
terraform destroy
```

---

# 📖 Documentation

Detailed step-by-step implementation guides are available in the **docs/** directory.

Each document explains:

- Objective
- Terraform code
- Code explanation
- Deployment
- Verification
- Best practices
- Common errors
- Interview questions

---

# 👨‍💻 Author

**Alfia Ali**

📧 flyalfia@gmail.com

🔗 GitHub: https://github.com/alfi-teachs

🔗 LinkedIn: https://linkedin.com/in/alfia-ali-83907a20

---

## ⭐ If you found this project useful, consider giving it a star on GitHub.