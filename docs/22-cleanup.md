# Step 22 - Cleanup Infrastructure

## Objective

In this step, we will safely remove all AWS resources created during this project to avoid unnecessary cloud costs.

Terraform makes cleanup simple by destroying all managed resources while maintaining dependency order.

---

# Why Cleanup Is Important

Leaving AWS resources running after completing a lab can result in unexpected charges.

Cleaning up infrastructure ensures:

- No unnecessary costs
- Clean AWS account
- Ability to redeploy from scratch
- Validation that Terraform can destroy resources successfully

---

# Resources to be Removed

Terraform will remove:

- Amazon RDS
- Auto Scaling Group
- Launch Template
- EC2 Instances
- Target Group
- Application Load Balancer
- Security Groups
- NAT Gateway
- Elastic IP
- Route Tables
- Internet Gateway
- Subnets
- VPC

---

# Verify Current Infrastructure

Run:

```bash
terraform state list
```

This command displays all resources currently managed by Terraform.

---

# Destroy Infrastructure

Run:

```bash
terraform destroy
```

Terraform will display all resources scheduled for deletion.

Review the plan carefully.

When prompted:

```text
Do you really want to destroy all resources?
```

Type:

```text
yes
```

Terraform will begin deleting all infrastructure.

---

# Verify Cleanup

Open the AWS Console and verify:

## EC2

- No running instances
- No Load Balancers
- No Target Groups
- No Auto Scaling Groups
- No Launch Templates

---

## VPC

- Custom VPC removed
- Subnets removed
- Route Tables removed
- Internet Gateway removed
- NAT Gateway removed

---

## Amazon RDS

- Database deleted
- DB Subnet Group deleted (if managed by Terraform)

---

## Elastic IP

Verify no Elastic IP remains allocated.

---

## S3 Backend

If using an S3 backend:

- Keep the bucket if you plan to reuse it.
- Otherwise, delete the bucket manually after removing all objects.

---

## DynamoDB

If using Terraform state locking:

Delete the DynamoDB table only if it is no longer needed.

---

# Verify Terraform State

Run:

```bash
terraform state list
```

Expected Result:

```
No state.
```

or an empty list.

---

# Best Practices

- Always run `terraform destroy` after completing a lab.
- Review the destroy plan before confirming.
- Keep remote state if the project will be reused.
- Delete unused AWS resources to avoid unnecessary charges.

---

# Common Errors

## DependencyViolation

Cause:

AWS resources are still attached.

Solution:

Wait a few minutes and retry.

---

## BucketNotEmpty

Cause:

The S3 bucket still contains objects.

Solution:

Delete all objects, then delete the bucket.

---

## ResourceInUse

Cause:

A dependent AWS resource is still active.

Solution:

Allow Terraform to finish or remove the dependency.

---

# Interview Questions

1. What does `terraform destroy` do?
2. Why should AWS resources be cleaned up after a lab?
3. What happens to the Terraform state after destruction?
4. Why is the destroy plan important?
5. Can Terraform destroy resources created outside Terraform?

---

# Next Step

Create a professional GitHub README that documents the complete project, architecture, prerequisites, deployment steps, screenshots, and learning outcomes.