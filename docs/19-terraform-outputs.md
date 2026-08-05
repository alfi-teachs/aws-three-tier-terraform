# Step 19 - Terraform Outputs

## Objective

In this step, we will create Terraform outputs to display important infrastructure information after deployment.

Outputs make it easier to retrieve values without searching through the AWS Console.

---

# What are Terraform Outputs?

Outputs expose values from Terraform resources after infrastructure has been created.

Examples include:

- VPC ID
- Public Subnet IDs
- Private Subnet IDs
- ALB DNS Name
- RDS Endpoint

---

# Why Use Outputs?

Outputs help you quickly retrieve important information without manually navigating the AWS Console.

---

# Terraform File

outputs.tf

---

# Outputs

```hcl
output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_1" {
  value = aws_subnet.public_subnet_1.id
}

output "public_subnet_2" {
  value = aws_subnet.public_subnet_2.id
}

output "private_subnet_1" {
  value = aws_subnet.private_subnet_1.id
}

output "private_subnet_2" {
  value = aws_subnet.private_subnet_2.id
}

output "alb_dns_name" {
  value = aws_lb.main.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.main.arn
}

output "launch_template_id" {
  value = aws_launch_template.main.id
}

output "autoscaling_group_name" {
  value = aws_autoscaling_group.main.name
}

output "rds_endpoint" {
  value = aws_db_instance.main.endpoint
}

output "rds_database_name" {
  value = aws_db_instance.main.db_name
}
```

---

# Apply

```bash
terraform fmt

terraform validate

terraform plan

terraform apply
```

---

# View Outputs

```bash
terraform output
```

Example:

```
vpc_id = "vpc-xxxxxxxx"

alb_dns_name = "aws-three-tier-alb-xxxxxxxx.ap-south-1.elb.amazonaws.com"

rds_endpoint = "aws-three-tier-db.xxxxxxxxx.ap-south-1.rds.amazonaws.com"
```

---

# Best Practices

- Output only useful information.
- Mark sensitive values as sensitive.
- Never output database passwords or secrets.

---

# Interview Questions

1. What are Terraform Outputs?
2. Why are Outputs useful?
3. How do you display Outputs?
4. Can Outputs contain sensitive values?

---

# Next Step

Configure a remote backend using Amazon S3 and DynamoDB.