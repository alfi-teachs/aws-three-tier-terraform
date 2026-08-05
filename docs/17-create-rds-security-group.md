# Step 17 - Create RDS Security Group

## Objective

In this step, we will create a Security Group for Amazon RDS.

The Security Group will allow MySQL (port 3306) access only from the EC2 Security Group. This ensures that only application servers can communicate with the database.

---

# What is an RDS Security Group?

An RDS Security Group acts as a virtual firewall for the database.

It controls:

- Which resources can connect to the database
- Which ports are open
- Which traffic is blocked

---

# Why Do We Need an RDS Security Group?

Without a Security Group:

- The database cannot receive traffic.
- The database may be exposed to unauthorized access if configured incorrectly.

With a Security Group:

- Only trusted EC2 instances can connect.
- The database remains private and secure.

---

# Architecture

                 Internet
                     │
      Application Load Balancer
                     │
          Auto Scaling Group
           │               │
           │               │
      EC2 Instance     EC2 Instance
              │
              │ MySQL (3306)
              ▼
      RDS Security Group
              │
         Amazon RDS

---

# Terraform File

security-group.tf

---

# Terraform Resource

```hcl
resource "aws_security_group" "rds" {

  name        = "${var.project_name}-rds-sg"

  description = "Security Group for RDS"

  vpc_id = aws_vpc.main.id

  ingress {

    from_port = 3306

    to_port = 3306

    protocol = "tcp"

    security_groups = [

      aws_security_group.ec2.id

    ]

  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {

    Name = "${var.project_name}-rds-sg"

  }

}
```

---

# Code Explanation

## VPC

Associates the Security Group with the project VPC.

---

## Ingress Rule

Allows MySQL traffic on port **3306**.

Only EC2 instances that belong to the EC2 Security Group are allowed to connect.

No public IP address is allowed.

---

## Egress Rule

Allows outbound traffic from the RDS instance.

---

## Tags

Tags help identify the Security Group in the AWS Console.

---

# Apply the Configuration

Run:

```bash
terraform fmt

terraform validate

terraform plan

terraform apply
```

---

# Verify in AWS

Go to:

AWS Console

↓

EC2

↓

Security Groups

Verify:

- RDS Security Group exists
- Port 3306 is open
- Source = EC2 Security Group
- No public inbound rule

---

# Screenshot

Save as:

screenshots/16-rds-security-group.png

---

# Best Practices

- Never allow MySQL (3306) from 0.0.0.0/0.
- Allow access only from the application Security Group.
- Keep the database in private subnets.
- Follow the principle of least privilege.

---

# Common Errors

### Error

Connection timed out

Cause:

The EC2 Security Group is not referenced correctly.

Solution:

Verify that the ingress rule references:

aws_security_group.ec2.id

---

# Interview Questions

1. Why does RDS need its own Security Group?
2. Why should port 3306 not be open to the internet?
3. Why reference the EC2 Security Group instead of an IP address?
4. What is the default port for MySQL?
5. What is the principle of least privilege?

---

# Next Step

Create the Amazon RDS MySQL instance using the DB Subnet Group and the RDS Security Group.