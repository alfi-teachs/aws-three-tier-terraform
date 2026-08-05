# Step 8 - Create NAT Gateway

## Objective

In this step, we will create a NAT Gateway to allow resources in the private subnets to access the internet without exposing them to inbound internet traffic.

---

# What is a NAT Gateway?

A NAT (Network Address Translation) Gateway is an AWS-managed service that enables outbound internet connectivity for resources located in private subnets.

Resources inside private subnets can:

- Download software updates
- Install packages
- Pull Docker images
- Access external APIs

However, inbound connections from the internet are not allowed.

---

# Why Do We Need a NAT Gateway?

Private resources should remain secure and inaccessible from the internet.

A NAT Gateway allows outbound communication while preventing inbound access.

---

# Architecture

Internet
    │
Internet Gateway
    │
Public Subnet
    │
NAT Gateway
    │
Private Route Table
    │
Private Subnets

---

# AWS Resources Created

- Elastic IP
- NAT Gateway

---

# Terraform File

nat.tf

```bash
resource "aws_eip" "nat" {

  domain = "vpc"

  tags = {
    Name = "${var.project_name}-nat-eip"
  }

}
```
Why do we need an Elastic IP?

A NAT Gateway requires a static public IP address.

AWS provides this through an Elastic IP (EIP).

### Step 2 – Create NAT Gateway

Add this below the Elastic IP:
```bash
resource "aws_nat_gateway" "main" {

  allocation_id = aws_eip.nat.id

  subnet_id = aws_subnet.public_subnet_1.id

  tags = {

    Name = "${var.project_name}-nat"

  }

  depends_on = [

    aws_internet_gateway.main

  ]

}
```
Explanation
- Elastic IP

allocation_id = aws_eip.nat.id

Attaches the Elastic IP to the NAT Gateway.

Public Subnet

subnet_id = aws_subnet.public_subnet_1.id

The NAT Gateway must be placed in a public subnet.

depends_on = [

    aws_internet_gateway.main

]

Ensures the Internet Gateway is created before the NAT Gateway.

Update the Private Route Table

Open route-table.tf.

Inside the private route table, add:

```bash
route {

  cidr_block = "0.0.0.0/0"

  nat_gateway_id = aws_nat_gateway.main.id

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

# Verification

AWS Console

↓

VPC

↓

NAT Gateways

Verify:

- NAT Gateway is Available
- Elastic IP is attached
- NAT Gateway is deployed in a public subnet

---

# Best Practices

- Deploy NAT Gateway in a public subnet.
- Allocate an Elastic IP.
- Route private subnet traffic through the NAT Gateway.
- Use one NAT Gateway per Availability Zone in production environments.

---
