# Step 13 - Create HTTP Listener

## Objective

In this step, we will create an HTTP Listener for the Application Load Balancer.

The Listener waits for incoming HTTP requests on port 80 and forwards them to the Target Group.

---

# What is a Listener?

A Listener is a process running on the Load Balancer that checks for incoming requests on a specific protocol and port.

Examples:

HTTP → Port 80

HTTPS → Port 443

---

# Why Do We Need a Listener?

Without a Listener, the Application Load Balancer cannot accept client requests.

The Listener defines:

- Which port to listen on
- Which protocol to use
- Where to forward requests

---

# Request Flow

Client

↓

Application Load Balancer

↓

Listener

↓

Target Group

↓

EC2 Instance

---

# Terraform File

alb.tf
```bash
resource "aws_lb_listener" "http" {

  load_balancer_arn = aws_lb.main.arn

  port = 80

  protocol = "HTTP"

  default_action {

    type = "forward"

    target_group_arn = aws_lb_target_group.main.arn

  }

}
```
```bash
Load Balancer

load_balancer_arn = aws_lb.main.arn

Attaches the Listener to the ALB.

Port

port = 80

The ALB listens for incoming HTTP traffic on port 80.

Protocol

protocol = "HTTP"

The Listener accepts HTTP requests.

Default Action

default_action {

  type = "forward"

}

Every request received by the Listener will be forwarded.

Target Group

target_group_arn = aws_lb_target_group.main.arn

The destination for all requests is the Target Group.
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

git commit -m "feat(alb): create HTTP listener"
```
---

# Verification

AWS Console

↓

EC2

↓

Load Balancers

↓

Listeners

Verify:

- HTTP Listener exists
- Port = 80
- Default Action = Forward
- Target Group attached

---

# Best Practices

- Redirect HTTP to HTTPS in production.
- Use HTTPS with ACM certificates.
- Configure listener rules for multiple applications.

---
Interview Questions
- What is an ALB Listener?
- Why do we need a Listener?
- What is the default action of a Listener?
- Can an ALB have multiple Listeners?
- What is the difference between an HTTP and HTTPS Listener?
- How does a Listener know where to forward requests?
-------------
