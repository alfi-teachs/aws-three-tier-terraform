# Step 9 - Create Security Groups

## Objective

In this step, we will create Security Groups to control inbound and outbound traffic for our AWS resources.

We will create separate Security Groups for:

- Application Load Balancer (ALB)
- EC2 Web Servers
- Amazon RDS Database

This follows the principle of least privilege by allowing only the required traffic between components.

---

# What is a Security Group?

A Security Group acts as a virtual firewall for AWS resources.

It controls:

- Inbound Traffic (Incoming)
- Outbound Traffic (Outgoing)

Security Groups are stateful.

This means that if inbound traffic is allowed, the response traffic is automatically allowed.

---

# Architecture

                Internet
                    │
               Port 80 / 443
                    │
           ALB Security Group
                    │
               Port 80
                    │
          EC2 Security Group
                    │
              Port 3306
                    │
          RDS Security Group

---

# Security Groups

## ALB Security Group

Inbound

- HTTP (80) from Anywhere
- HTTPS (443) from Anywhere

Outbound

- All Traffic

---

## EC2 Security Group

Inbound

- HTTP (80) from ALB Security Group
- SSH (22) from your IP (optional)

Outbound

- All Traffic

---

## RDS Security Group

Inbound

- MySQL (3306) from EC2 Security Group

Outbound

- Default

---

# Terraform File

security-group.tf

ALB Security Group
```bash
resource "aws_security_group" "alb" {

  name        = "${var.project_name}-alb-sg"
  description = "ALB Security Group"
  vpc_id      = aws_vpc.main.id

  ingress {

    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {

    Name = "${var.project_name}-alb-sg"

  }

}
```
EC2 Security Group
```bash
resource "aws_security_group" "ec2" {

  name        = "${var.project_name}-ec2-sg"
  description = "EC2 Security Group"
  vpc_id      = aws_vpc.main.id

  ingress {

    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    security_groups = [

      aws_security_group.alb.id

    ]

  }

  ingress {

    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [

      "0.0.0.0/0"

    ]

  }

  egress {

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [

      "0.0.0.0/0"

    ]

  }

  tags = {

    Name = "${var.project_name}-ec2-sg"

  }

}
```
For production, replace 0.0.0.0/0 on port 22 with your public IP address to restrict SSH access.

RDS Security Group
```bash
resource "aws_security_group" "rds" {

  name        = "${var.project_name}-rds-sg"
  description = "RDS Security Group"
  vpc_id      = aws_vpc.main.id

  ingress {

    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"

    security_groups = [

      aws_security_group.ec2.id

    ]

  }

  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {

    Name = "${var.project_name}-rds-sg"

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

Git Commit
```bash
git add .

git commit -m "feat(security): create security groups"
```
---

# Verification

AWS Console

↓

EC2

↓

Security Groups

Verify:

- ALB Security Group
- EC2 Security Group
- RDS Security Group

---

# Best Practices

- Follow the Principle of Least Privilege.
- Avoid opening SSH (22) to the world.
- Allow communication using Security Group references instead of IP addresses.
- Keep inbound rules as restrictive as possible.

---
Interview Questions
- What is a Security Group?
- What is the difference between a Security Group and a Network ACL?
- Why are Security Groups called stateful?
- Why is it better to reference another Security Group instead of an IP address?
- Why should SSH not be open to 0.0.0.0/0 in production?
- Why is the RDS Security Group configured to allow traffic only from the EC2 Security Group?
- What does the Principle of Least Privilege mean?
