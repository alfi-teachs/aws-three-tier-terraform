# Step 7 - Create Route Tables

## Objective

In this step, we will create Route Tables and associate them with the public and private subnets.

The public Route Table will send internet traffic through the Internet Gateway.

The private Route Table will be used by private subnets and will later send internet traffic through a NAT Gateway.

---

# What is a Route Table?

A Route Table contains rules (routes) that determine where network traffic should go.

Every subnet must be associated with a Route Table.

---

# Why Do We Need Route Tables?

Without a Route Table, AWS does not know where to send traffic.

Example:

Destination

↓

0.0.0.0/0

↓

Internet Gateway

This tells AWS:

"If the destination is outside the VPC, send the traffic to the Internet Gateway."

---

# Public Route Table

Routes

Destination

0.0.0.0/0

↓

Internet Gateway

---

# Private Route Table

Initially, the private Route Table contains only local routes.

Later, we will add a route to the NAT Gateway.

---

# Architecture

Internet
    │
Internet Gateway
    │
Public Route Table
    │
──────────────
│            │
Public A   Public B


Private Route Table
    │
──────────────
│            │
Private A  Private B

---

# Terraform File

route-table.tf

Public Route Table

```bash
resource "aws_route_table" "public" {

  vpc_id = aws_vpc.main.id

  route {

    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.main.id

  }

  tags = {

    Name = "${var.project_name}-public-rt"

  }

}
```
Private Route Table
```bash
resource "aws_route_table" "private" {

  vpc_id = aws_vpc.main.id

  tags = {

    Name = "${var.project_name}-private-rt"

  }

}
```
Associate Public Subnet 1
```bash
resource "aws_route_table_association" "public_subnet_1" {

  subnet_id = aws_subnet.public_subnet_1.id

  route_table_id = aws_route_table.public.id

}
```
Associate Public Subnet 2
```bash

resource "aws_route_table_association" "public_subnet_2" {

  subnet_id = aws_subnet.public_subnet_2.id

  route_table_id = aws_route_table.public.id

}
```
Associate Private Subnet 1
```bash
resource "aws_route_table_association" "private_subnet_1" {

  subnet_id = aws_subnet.private_subnet_1.id

  route_table_id = aws_route_table.private.id

}
```
Associate Private Subnet 2
```bash
resource "aws_route_table_association" "private_subnet_2" {

  subnet_id = aws_subnet.private_subnet_2.id

  route_table_id = aws_route_table.private.id

}
```
---

# Commands
```bash
terraform fmt

terraform plan

terraform apply
```
Git Commit
```bash
git add .

git commit -m "feat(network): create route tables"Git Commit
```
---

# Verification

AWS Console

↓

VPC

↓

Route Tables

Verify:

- Public Route Table exists
- Private Route Table exists
- Public Route points to IGW
- Correct subnet associations

---

# Next Step

Create NAT Gateway.