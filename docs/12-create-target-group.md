# Step 12 - Create Target Group

## Objective

In this step, we will create an Application Load Balancer Target Group.

The Target Group acts as a bridge between the Application Load Balancer and the EC2 instances.

It receives requests from the ALB and forwards them to healthy EC2 instances.

---

# What is a Target Group?

A Target Group is a collection of backend resources that receive traffic from the Load Balancer.

Supported targets include:

- EC2 Instances
- IP Addresses
- Lambda Functions

---

# Why Do We Need a Target Group?

Without a Target Group, the ALB has no destination for incoming requests.

The Target Group:

- Registers backend instances
- Performs health checks
- Routes traffic only to healthy instances

---

# Architecture

Internet
    │
Application Load Balancer
    │
Target Group
    │
EC2 Instances

---

# Health Checks

Health checks verify whether backend instances are healthy.

Only healthy instances receive traffic.

---

# Terraform File

alb.tf
```bash
resource "aws_lb_target_group" "main" {

  name     = "${var.project_name}-tg"

  port     = 80

  protocol = "HTTP"

  vpc_id   = aws_vpc.main.id

  target_type = "instance"

  health_check {

    enabled = true

    path = "/"

    protocol = "HTTP"

    matcher = "200"

    healthy_threshold = 2

    unhealthy_threshold = 2

    interval = 30

    timeout = 5

  }

  tags = {

    Name = "${var.project_name}-tg"

  }

}
```
Name

name = "${var.project_name}-tg"

Example:

aws-three-tier-tg

Port

port = 80

The Target Group forwards traffic to web servers on HTTP port 80.

Protocol

protocol = "HTTP"

The communication between the ALB and the backend instances uses HTTP.

Target Type

target_type = "instance"

The Target Group will register EC2 instances.

Health Check

health_check {

    path = "/"
}

The ALB periodically requests:

http://<instance-ip>/

If the instance returns HTTP 200, it is considered healthy.
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

git commit -m "feat(alb): create target group"
```
---

# Verification

AWS Console

↓

EC2

↓

Target Groups

Verify:

- Target Group created
- Protocol = HTTP
- Port = 80
- Target Type = Instance
- Health Check = /

---
Interview Questions

- What is a Target Group?
- Why does an ALB require a Target Group?
- What is the purpose of health checks?
- What happens if an EC2 instance fails a health check?
- What are the supported target types?
- Can multiple ALBs use the same Target Group?
---------------