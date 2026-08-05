# Step 18 - Create Amazon RDS MySQL Instance

## Objective

In this step, we will create an Amazon RDS MySQL instance inside the private subnets using the DB Subnet Group and the RDS Security Group.

The database will only be accessible from the application servers running in the Auto Scaling Group.

---

# What is Amazon RDS?

Amazon Relational Database Service (RDS) is a managed database service provided by AWS.

AWS manages:

- Software installation
- Operating system updates
- Database backups
- Monitoring
- Automatic recovery

This allows developers to focus on the application instead of database administration.

---

# Why Use Amazon RDS?

Compared to running MySQL on an EC2 instance, Amazon RDS provides:

- Automated backups
- Automatic patching
- High availability options
- Monitoring
- Easier maintenance
- Improved reliability

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
        Amazon RDS MySQL
              │
      DB Subnet Group
              │
 Private Subnet 1 & Private Subnet 2

---

# Terraform File

rds.tf

---

# Terraform Resource

```hcl
resource "aws_db_instance" "main" {

  identifier = "${var.project_name}-db"

  engine = "mysql"

  engine_version = "8.0"

  instance_class = "db.t3.micro"

  allocated_storage = 20

  storage_type = "gp3"

  db_name = "appdb"

  username = var.db_username

  password = var.db_password

  db_subnet_group_name = aws_db_subnet_group.main.name

  vpc_security_group_ids = [
    aws_security_group.rds.id
  ]

  publicly_accessible = false

  multi_az = false

  skip_final_snapshot = true

  backup_retention_period = 7

  deletion_protection = false

  tags = {
    Name = "${var.project_name}-rds"
  }

}
```

---

# Code Explanation

## Database Engine

```hcl
engine = "mysql"
```

Creates a MySQL database.

---

## Instance Class

```hcl
instance_class = "db.t3.micro"
```

Suitable for learning and small workloads.

---

## Storage

```hcl
allocated_storage = 20
```

Creates a 20 GB database volume.

---

## Database Name

```hcl
db_name = "appdb"
```

Creates the initial database named **appdb**.

---

## Credentials

```hcl
username = var.db_username

password = var.db_password
```

Database credentials are stored as Terraform variables.

---

## DB Subnet Group

```hcl
db_subnet_group_name = aws_db_subnet_group.main.name
```

Deploys the database into the private subnets.

---

## Security Group

```hcl
vpc_security_group_ids = [
  aws_security_group.rds.id
]
```

Allows only the application servers to connect.

---

## Public Access

```hcl
publicly_accessible = false
```

Keeps the database private.

---

## Multi-AZ

```hcl
multi_az = false
```

Disabled for this lab to reduce cost.

---

## Backups

```hcl
backup_retention_period = 7
```

Retains automated backups for seven days.

---

# Variables

Add the following to `variables.tf`:

```hcl
variable "db_username" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}
```

---

# terraform.tfvars

```hcl
db_username = "admin"

db_password = "ChangeMe123!"
```

> Replace the password with a strong password before deploying.

---

# Apply the Configuration

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

Amazon RDS

↓

Databases

Verify:

- MySQL engine
- Status = Available
- Private access only
- DB Subnet Group attached
- RDS Security Group attached

---

# Screenshot

Save as:

screenshots/17-rds-instance.png

---

# Best Practices

- Use private subnets for databases.
- Never expose the database to the internet.
- Store passwords securely (AWS Secrets Manager or SSM Parameter Store in production).
- Enable Multi-AZ for production deployments.
- Enable deletion protection for production databases.

---

# Common Errors

### Error

DBInstanceAlreadyExists

**Solution**

Change the `identifier` value or delete the existing database.

---

### Error

InvalidParameterCombination

**Cause**

The DB Subnet Group or Security Group is incorrect.

**Solution**

Verify both resources exist and belong to the same VPC.

---

# Interview Questions

1. What is Amazon RDS?
2. Why is RDS deployed in private subnets?
3. What is the purpose of a DB Subnet Group?
4. Why is `publicly_accessible` set to `false`?
5. What is the difference between Single-AZ and Multi-AZ?
6. Why should database passwords not be hardcoded?

---

# Next Step

Create Terraform outputs to display useful information such as:

- ALB DNS Name
- RDS Endpoint
- VPC ID
- Subnet IDs

After that, we will configure a remote backend using Amazon S3 and DynamoDB for Terraform state management.