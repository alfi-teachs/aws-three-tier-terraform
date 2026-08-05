# Step 6 - Create Internet Gateway

## Objective

In this step, we will create an Internet Gateway (IGW) and attach it to our VPC.

The Internet Gateway enables communication between resources in the public subnets and the internet.

Without an Internet Gateway, resources inside the VPC cannot send or receive internet traffic.

---

# What is an Internet Gateway?

An Internet Gateway (IGW) is a highly available AWS-managed networking component that allows a VPC to communicate with the internet.

It performs two main functions:

- Enables inbound internet traffic.
- Enables outbound internet traffic.

---

# Why Do We Need an Internet Gateway?

Resources in public subnets, such as:

- Application Load Balancer
- Bastion Host
- NAT Gateway

need internet connectivity.

The Internet Gateway provides that connectivity.

---

# Architecture

                Internet
                    │
             Internet Gateway
                    │
               Custom VPC
                    │
       ┌────────────┴────────────┐
       │                         │
 Public Subnets           Private Subnets

---

# Terraform File

igw.tf
```bash
resource "aws_internet_gateway" "main" {

  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-igw"
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
---
git commit 
```bash
git add .
git commit -m "feat(network): create internet gateway"
```
# Verification

AWS Console

↓

VPC

↓

Internet Gateways

Verify:

- Internet Gateway is created.
- Internet Gateway is attached to the correct VPC.

---

# Best Practices

- One Internet Gateway per VPC.
- Attach the Internet Gateway immediately after creating the VPC.
- Use meaningful tags.
- Keep Internet Gateway configuration separate from Route Tables.

---

