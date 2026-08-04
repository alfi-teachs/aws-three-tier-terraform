# Step 5 - Create Public and Private Subnets

## Objective

In this step, we will create four subnets inside our VPC.

- Two Public Subnets
- Two Private Subnets

These subnets will be distributed across two Availability Zones to improve high availability and fault tolerance.

---

# What is a Subnet?

A subnet is a smaller network created inside a VPC.

It divides a large network into multiple smaller networks.

Each subnet belongs to one Availability Zone.

---

# Why Do We Need Subnets?

Subnets help us:

- Organize AWS resources
- Improve security
- Separate public and private resources
- Build highly available applications

---

# Public Subnet

Resources inside a public subnet can communicate with the Internet.

Examples:

- Load Balancer
- Bastion Host
- NAT Gateway

---

# Private Subnet

Resources inside a private subnet cannot be accessed directly from the Internet.

Examples:

- Application Servers
- Databases
- Internal Services

---

# Architecture

                 VPC (10.0.0.0/16)

        ┌─────────────────────────────┐
        │                             │
        │  Public Subnet A            │
        │      10.0.1.0/24            │
        │                             │
        │  Public Subnet B            │
        │      10.0.2.0/24            │
        │                             │
        │  Private Subnet A           │
        │      10.0.11.0/24           │
        │                             │
        │  Private Subnet B           │
        │      10.0.12.0/24           │
        │                             │
        └─────────────────────────────┘

---

# Availability Zones

Public Subnet A
→ ap-south-1a

Public Subnet B
→ ap-south-1b

Private Subnet A
→ ap-south-1a

Private Subnet B
→ ap-south-1b

---

# Best Practices

- Use at least two Availability Zones.
- Separate public and private resources.
- Use meaningful tags.
- Keep subnet CIDR blocks organized.

---

# Terraform File
variables.tf

```bash
variable "public_subnet_1_cidr" {
  description = "CIDR for Public Subnet 1"
  type        = string
}

variable "public_subnet_2_cidr" {
  description = "CIDR for Public Subnet 2"
  type        = string
}

variable "private_subnet_1_cidr" {
  description = "CIDR for Private Subnet 1"
  type        = string
}

variable "private_subnet_2_cidr" {
  description = "CIDR for Private Subnet 2"
  type        = string
}

variable "availability_zone_1" {
  description = "Primary Availability Zone"
  type        = string
}

variable "availability_zone_2" {
  description = "Secondary Availability Zone"
  type        = string
}
```
terraform.tfvars

```bash
aws_region = "ap-south-1"

project_name = "aws-three-tier"

environment = "dev"

vpc_cidr = "10.0.0.0/16"

public_subnet_1_cidr = "10.0.1.0/24"

public_subnet_2_cidr = "10.0.2.0/24"

private_subnet_1_cidr = "10.0.11.0/24"

private_subnet_2_cidr = "10.0.12.0/24"

availability_zone_1 = "ap-south-1a"

availability_zone_2 = "ap-south-1b"
```
Public Subnet 1
subnet.tf
```bash
resource "aws_subnet" "public_subnet_1" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.public_subnet_1_cidr

  availability_zone = var.availability_zone_1

  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-public-subnet-1"
  }

}
```
Public Subnet 2
```bash
resource "aws_subnet" "public_subnet_2" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.public_subnet_2_cidr

  availability_zone = var.availability_zone_2

  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-public-subnet-2"
  }

}
```
Private Subnet 1
```bash
resource "aws_subnet" "private_subnet_1" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.private_subnet_1_cidr

  availability_zone = var.availability_zone_1

  tags = {
    Name = "${var.project_name}-private-subnet-1"
  }

}
```
Private Subnet 2
```bash
resource "aws_subnet" "private_subnet_2" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.private_subnet_2_cidr

  availability_zone = var.availability_zone_2

  tags = {
    Name = "${var.project_name}-private-subnet-2"
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

git commit -m "feat(network): create public and private subnets"
```
---

# Verification

AWS Console

VPC

↓

Subnets

Verify:

- Four subnets created
- Correct CIDR blocks
- Correct Availability Zones
- Correct VPC

---

Interview Questions

Make sure you can answer these before we continue:

- What is a subnet?
- What is the difference between a public and a private subnet?
- Why do we use multiple Availability Zones?
- Why do public subnets use map_public_ip_on_launch = true?
- Why are databases usually placed in private subnets?
- How does Terraform know which VPC the subnet belongs to?
- Why did we choose /24 CIDR blocks for the subnets?