# Step 21 - Testing & Validation

## Objective

In this step, we will verify that all AWS resources have been created successfully and that the three-tier infrastructure is functioning as expected.

---

# Architecture

                    Internet
                        │
          Application Load Balancer
                        │
                  Target Group
                        │
              Auto Scaling Group
               │               │
               │               │
            EC2-1           EC2-2
                  │
                  │
              Amazon RDS

---

# Validation Checklist

## VPC

AWS Console

↓

VPC

Verify:

- VPC created
- Correct CIDR Block

Status

✅ Pass

---

## Public Subnets

Verify:

- Two public subnets
- Correct Availability Zones

Status

✅ Pass

---

## Private Subnets

Verify:

- Two private subnets
- Correct CIDR ranges

Status

✅ Pass

---

## Internet Gateway

Verify:

- Attached to the VPC

Status

✅ Pass

---

## NAT Gateway

Verify:

- Created
- Elastic IP attached

Status

✅ Pass

---

## Route Tables

Verify:

Public Route Table

- Route to Internet Gateway

Private Route Table

- Route to NAT Gateway

Status

✅ Pass

---

## Security Groups

Verify:

ALB Security Group

- HTTP (80)
- HTTPS (443)

EC2 Security Group

- HTTP from ALB
- SSH (if enabled)

RDS Security Group

- MySQL (3306) from EC2 Security Group only

Status

✅ Pass

---

## Application Load Balancer

Verify:

- Active
- Internet-facing
- Two public subnets attached

Status

✅ Pass

---

## Target Group

Verify:

- Targets registered
- Health Status = Healthy

Status

✅ Pass

---

## Auto Scaling Group

Verify:

- Desired Capacity = 2
- Min Size = 2
- Max Size = 4

Status

✅ Pass

---

## EC2 Instances

Verify:

- Two running instances
- Created using Launch Template
- Located in private subnets

Status

✅ Pass

---

## Amazon RDS

Verify:

- MySQL engine
- Private access only
- Available state

Status

✅ Pass

---

# Functional Testing

## Test the Load Balancer

Copy the ALB DNS Name.

Example:

```

http://aws-three-tier-alb-xxxxxxxx.ap-south-1.elb.amazonaws.com

```

Open it in a browser.

Expected Result

Apache Web Server page loads successfully.

Status

✅ Pass

---

## Test Auto Scaling

Terminate one EC2 instance.

AWS Console

↓

EC2

↓

Terminate Instance

Expected Result

Auto Scaling launches a replacement automatically.

Status

✅ Pass

---

## Test Target Group

Verify:

AWS Console

↓

Target Groups

↓

Targets

Expected Result

Healthy Targets = 2

Status

✅ Pass

---

## Terraform Validation

Run:

```bash
terraform fmt

terraform validate

terraform plan
```

Expected Result

```
No changes.
Infrastructure is up-to-date.
```

Status

✅ Pass

---

# Screenshots

Capture the following screenshots:

- VPC
- Subnets
- Route Tables
- NAT Gateway
- Security Groups
- Load Balancer
- Target Group
- Auto Scaling Group
- EC2 Instances
- Amazon RDS
- Terraform Output
- ALB Web Page

Store them in:

```
screenshots/
```

---

# Troubleshooting

## Target Group Unhealthy

Possible Causes:

- Apache is not running
- Incorrect Security Group
- Wrong Health Check Path

---

## Auto Scaling Does Not Launch Instances

Possible Causes:

- Launch Template error
- Invalid AMI
- Wrong IAM permissions

---

## RDS Connection Failed

Possible Causes:

- Incorrect Security Group
- Wrong Endpoint
- Database not available

---

# Best Practices

- Verify infrastructure after every deployment.
- Keep Terraform state synchronized.
- Capture screenshots for documentation.
- Test failure recovery using Auto Scaling.

---

# Interview Questions

1. How do you validate a Terraform deployment?
2. How do you verify an Application Load Balancer?
3. How do you test Auto Scaling?
4. What would you do if the Target Group reports unhealthy instances?
5. How do you confirm RDS is private?
6. Why should testing be performed after every infrastructure change?

---

# Next Step

Clean up the infrastructure and prepare the repository for GitHub.