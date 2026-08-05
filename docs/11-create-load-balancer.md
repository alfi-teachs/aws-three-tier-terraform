architecture
```bash

                   Internet
                       │
                Application Load Balancer
                 (Public Subnets)
                       │
               HTTP Listener (80)
                       │
                 Target Group
                       │
        ┌──────────────┴──────────────┐
        │                             │
     EC2 Instance 1              EC2 Instance 2
   (Private Subnet 1)          (Private Subnet 2)

   ```

# Step 11 - Create Application Load Balancer (ALB)

## Objective

In this step, we will create an Application Load Balancer (ALB) that distributes incoming HTTP requests across multiple EC2 instances.

The ALB improves:

- High Availability
- Fault Tolerance
- Scalability
- Performance

---

# What is an Application Load Balancer?

An Application Load Balancer (ALB) is an AWS service that distributes incoming HTTP and HTTPS traffic across multiple targets such as EC2 instances, containers, or IP addresses.

It operates at Layer 7 (Application Layer) of the OSI model.

---

# Why Do We Need an ALB?

Without an ALB:

Internet

↓

EC2 Instance

If that EC2 instance fails, the application becomes unavailable.

With an ALB:

Internet

↓

Application Load Balancer

↓

EC2 Instance 1

EC2 Instance 2

The ALB automatically routes traffic only to healthy instances.

---

# Features

- Layer 7 Load Balancing
- SSL Termination
- Health Checks
- Path-based Routing
- Host-based Routing
- High Availability
- Cross Availability Zone Load Balancing

---

# Architecture

                 Internet
                     │
          Application Load Balancer
                     │
              Target Group
                     │
      ┌──────────────┴──────────────┐
      │                             │
 EC2 Instance 1               EC2 Instance 2

---

# AWS Resources

- Application Load Balancer
- ALB Security Group
- Public Subnet 1
- Public Subnet 2

---

# Terraform File

alb.tf

```bash
resource "aws_lb" "main" {

  name               = "${var.project_name}-alb"

  internal           = false

  load_balancer_type = "application"

  security_groups = [

    aws_security_group.alb.id

  ]

  subnets = [

    aws_subnet.public_subnet_1.id,
    aws_subnet.public_subnet_2.id

  ]

  enable_deletion_protection = false

  tags = {

    Name = "${var.project_name}-alb"

  }

}
```
Code Explanation

Resource

resource "aws_lb" "main"

Creates an Application Load Balancer.

Name

name = "${var.project_name}-alb"

Example:

- aws-three-tier-alb
- Internet Facing
- internal = false
- false = Internet-facing Load Balancer
- true = Internal Load Balancer (private)
- Load Balancer Type
- load_balancer_type = "application"

Creates an Application Load Balancer (ALB).

Other options include:

- application
- network
- gateway
- Security Group
- security_groups = [

  aws_security_group.alb.id

]

Attaches the ALB Security Group created earlier.

The ALB accepts HTTP/HTTPS traffic based on this Security Group.

Public Subnets

subnets = [

  aws_subnet.public_subnet_1.id,

  aws_subnet.public_subnet_2.id

]

The ALB must be deployed in at least two public subnets for high availability.

Tags

tags = {

  Name = "${var.project_name}-alb"

}

Helps identify the resource in the AWS Console.

---

# Commands
```badh
terraform fmt

terraform plan

terraform apply
```
Git Commit
```bash
git add .

git commit -m "feat(alb): create application load balancer"
```
---

# Verification

AWS Console

↓

EC2

↓

Load Balancers

Verify:

- Load Balancer State = Active
- Scheme = Internet-facing
- Type = Application
- Two public subnets attached

---

# Best Practices

- Deploy ALB in at least two Availability Zones.
- Use HTTPS in production.
- Enable access logs.
- Configure health checks.

---

# Next Step

Create a Target Group.