# Step 16 - Create Amazon RDS

## Step 16.1 - Create DB Subnet Group

## Objective

In this step, we will create a DB Subnet Group for Amazon RDS.

A DB Subnet Group is a collection of subnets where Amazon RDS can launch database instances. AWS requires at least two subnets in different Availability Zones for high availability.

For this project, we will use our two private subnets.

---

# What is a DB Subnet Group?

A DB Subnet Group is a logical grouping of VPC subnets that Amazon RDS uses to deploy database instances.

Instead of placing the database in public subnets, AWS best practice is to deploy it inside private subnets for better security.

---

# Why Do We Need a DB Subnet Group?

Without a DB Subnet Group:

- Amazon RDS cannot determine where to deploy the database.
- The RDS instance cannot be launched inside the VPC.

With a DB Subnet Group:

- RDS is deployed in private subnets.
- The database remains isolated from the public internet.
- High availability is supported across multiple Availability Zones.

---

# Architecture

```
                 Internet
                     │
      Application Load Balancer
                     │
          Auto Scaling Group
           │               │
           │               │
       EC2 Instance     EC2 Instance
            │               │
            └───────┬───────┘
                    │
            DB Subnet Group
          ┌─────────┴─────────┐
          │                   │
 Private Subnet 1      Private Subnet 2
                    │
               Amazon RDS
```

---

# Terraform File

```
rds.tf
```

---

# Terraform Resource

```hcl
resource "aws_db_subnet_group" "main" {

  name = "${var.project_name}-db-subnet-group"

  subnet_ids = [
    aws_subnet.private_subnet_1.id,
    aws_subnet.private_subnet_2.id
  ]

  tags = {
    Name = "${var.project_name}-db-subnet-group"
  }

}
```

---

# Code Explanation

## Name

```hcl
name = "${var.project_name}-db-subnet-group"
```

Creates a unique name for the DB Subnet Group.

---

## Private Subnets

```hcl
subnet_ids = [
  aws_subnet.private_subnet_1.id,
  aws_subnet.private_subnet_2.id
]
```

Associates the DB Subnet Group with the two private subnets created earlier.

This ensures the database is deployed in private network segments.

---

## Tags

```hcl
tags = {
  Name = "${var.project_name}-db-subnet-group"
}
```

Tags make resources easier to identify and manage in the AWS Console.

---

# Apply the Configuration

Run the following commands:

```bash
terraform fmt

terraform validate

terraform plan

terraform apply
```

Type:

```text
yes
```

---

# Verify in AWS

Go to:

```
AWS Console
    ↓
Amazon RDS
    ↓
Subnet Groups
```

Verify:

- DB Subnet Group created successfully
- Two private subnets are associated
- Status shows **Complete**

---

# Screenshot

Save a screenshot as:

```
screenshots/15-db-subnet-group.png
```

---

# Best Practices

- Always use private subnets for databases.
- Include subnets from at least two Availability Zones.
- Do not deploy RDS in public subnets.
- Use meaningful resource names and tags.

---

# Common Errors

### Error

```
DBSubnetGroupDoesNotCoverEnoughAZs
```

**Cause**

The subnet group contains subnets from only one Availability Zone.

**Solution**

Add private subnets from at least two different Availability Zones.

---

### Error

```
InvalidSubnet
```

**Cause**

The subnet IDs are incorrect or do not exist.

**Solution**

Verify the subnet resource names and IDs in Terraform.

---

# Interview Questions

1. What is a DB Subnet Group?
2. Why does Amazon RDS require a DB Subnet Group?
3. Why should databases be deployed in private subnets?
4. How many Availability Zones should a DB Subnet Group include?
5. Can an RDS instance exist without a DB Subnet Group inside a VPC?

---

# Next Step

In the next step, we will create the **RDS Security Group**, allowing MySQL (port 3306) access only from the EC2 Security Group. This ensures that the database is accessible only by the application servers and remains protected from direct internet access.