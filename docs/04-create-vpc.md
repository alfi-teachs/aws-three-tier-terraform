# Step 4 - Create VPC

## Objective

The objective of this step is to create a custom Virtual Private Cloud (VPC) that will serve as the network foundation for all AWS resources in this project.

All resources including EC2 instances, Load Balancer, NAT Gateway, and RDS will be deployed inside this VPC.

---

# What is a VPC?

Amazon Virtual Private Cloud (VPC) is a logically isolated virtual network in AWS where you can launch and manage your cloud resources securely.

A VPC gives you complete control over:

- IP Address Range
- Subnets
- Route Tables
- Internet Access
- Security
- Network Configuration

Think of a VPC as your own private data center inside AWS.

---

# Why Do We Need a VPC?

A VPC allows you to:

- Isolate your infrastructure from other AWS customers.
- Control inbound and outbound network traffic.
- Organize resources into public and private networks.
- Improve security.
- Build scalable cloud architectures.

---

# Default VPC vs Custom VPC

| Default VPC | Custom VPC |
|-------------|------------|
| Created automatically | Created by the user |
| Less control | Full control |
| Basic networking | Production-ready networking |
| Suitable for testing | Recommended for production |

In this project, we will create a custom VPC.

---

# CIDR Block

Our VPC CIDR Block:

```
10.0.0.0/16
```

This provides up to 65,536 IP addresses, making it suitable for medium to large AWS environments.

---

# Architecture

```
AWS

┌──────────────────────────────┐
│          Custom VPC          │
│        10.0.0.0/16           │
│                              │
│  Public Subnets              │
│  Private Subnets             │
│                              │
└──────────────────────────────┘
```

---

# Terraform File

vpc.tf
```bash
resource "aws_vpc" "main" {

  cidr_block = var.vpc_cidr

  enable_dns_support = true

  enable_dns_hostnames = true

  tags = {

    Name = "${var.project_name}-vpc"

  }

}
```

---

# Commands
```bash
terraform fmt

terraform plan

terraform apply
```

git commit 
```bash
git add .
git commit -m "feat(vpc): create custom VPC"
```

---

# Verification

After deployment, verify:

- VPC Name
- CIDR Block
- DNS Hostnames
- DNS Resolution

AWS Console

VPC → Your VPCs

---

# Best Practices

- Use a custom VPC instead of the default VPC.
- Enable DNS Support.
- Enable DNS Hostnames.
- Apply consistent tags.
- Use meaningful resource names.

---
