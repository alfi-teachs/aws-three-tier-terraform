# Step 15 - Create Auto Scaling Group

## Objective

In this step, we will create an Auto Scaling Group (ASG) that automatically launches and manages EC2 instances using the Launch Template.

The Auto Scaling Group ensures that the desired number of healthy EC2 instances are always running.

---

# What is an Auto Scaling Group?

An Auto Scaling Group (ASG) automatically launches, terminates, and replaces EC2 instances based on the desired capacity.

It provides:

- High Availability
- Fault Tolerance
- Automatic Recovery
- Scalability

---

# Why Do We Need an Auto Scaling Group?

Without an ASG:

- Failed EC2 instances must be replaced manually.
- Scaling requires manual intervention.

With an ASG:

- Failed instances are replaced automatically.
- Scaling is automatic.
- Instances are distributed across multiple Availability Zones.

---

# Architecture

                Internet
                    │
        Application Load Balancer
                    │
             Target Group
                    │
         Auto Scaling Group
          ┌──────────┴──────────┐
          │                     │
     EC2 Instance 1       EC2 Instance 2
    Private Subnet 1     Private Subnet 2

---

# Terraform File

autoscaling.tf
```bash
resource "aws_autoscaling_group" "main" {

  name = "${var.project_name}-asg"

  desired_capacity = 2

  min_size = 2

  max_size = 4

  vpc_zone_identifier = [

    aws_subnet.private_subnet_1.id,
    aws_subnet.private_subnet_2.id

  ]

  target_group_arns = [

    aws_lb_target_group.main.arn

  ]

  health_check_type = "ELB"

  health_check_grace_period = 300

  launch_template {

    id = aws_launch_template.main.id

    version = "$Latest"

  }

  tag {

    key = "Name"

    value = "${var.project_name}-web"

    propagate_at_launch = true

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

# Verification

AWS Console

↓

EC2

↓

Auto Scaling Groups

Verify:

- ASG created
- Desired Capacity = 2
- Min Size = 2
- Max Size = 4
- Instances launched
- Instances registered with Target Group

---

# Best Practices

- Deploy instances across multiple Availability Zones.
- Attach the Target Group.
- Enable Health Checks.
- Use Launch Templates instead of Launch Configurations.

---

