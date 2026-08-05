# Step 20 - Configure Terraform Remote Backend

## Objective

In this step, we will configure a remote backend for Terraform using Amazon S3 and DynamoDB.

Instead of storing the Terraform state file locally, it will be stored securely in an S3 bucket, while DynamoDB will provide state locking to prevent multiple users from modifying the infrastructure simultaneously.

---

# Why Do We Need a Remote Backend?

By default, Terraform stores its state in a local file named:

terraform.tfstate

This causes problems when working in teams because:

- The state file can be lost.
- Team members may overwrite each other's changes.
- There is no state locking.

A remote backend solves these issues.

---

# Architecture

Developer

↓

Terraform

↓

Amazon S3 (terraform.tfstate)

↓

DynamoDB (State Lock)

---

# Benefits

- Centralized state storage
- State locking
- Team collaboration
- Versioning
- Disaster recovery

---

# AWS Resources

- Amazon S3 Bucket
- DynamoDB Table

---

# Step 1 - Create an S3 Bucket

AWS Console

↓

Amazon S3

↓

Create Bucket

Example Name:

my-terraform-state-bucket

Enable:

- Versioning
- Block Public Access

---

# Step 2 - Create DynamoDB Table

AWS Console

↓

DynamoDB

↓

Create Table

Table Name:

terraform-locks

Partition Key:

LockID

Type:

String

---

# Terraform Backend Configuration

Create or update backend.tf

```hcl
terraform {

  backend "s3" {

    bucket = "my-terraform-state-bucket"

    key = "aws-three-tier-terraform/terraform.tfstate"

    region = "ap-south-1"

    dynamodb_table = "terraform-locks"

    encrypt = true

  }

}
```

---

# Initialize Backend

Run:

```bash
terraform init
```

Terraform will ask:

```
Do you want to copy the existing state to the new backend?
```

Type:

```
yes
```

Terraform uploads the local state file to Amazon S3.

---

# Verify

Amazon S3

↓

Bucket

↓

terraform.tfstate

Verify that the state file exists.

---

# Verify Locking

Start one Terraform operation.

During execution, a record appears inside:

Amazon DynamoDB

↓

terraform-locks

After Terraform finishes, the lock is removed automatically.

---

# Best Practices

- Enable bucket versioning.
- Enable server-side encryption.
- Restrict bucket access using IAM.
- Never store the state file in GitHub.
- Use DynamoDB for state locking.

---

# Common Errors

### Error

```
Bucket does not exist
```

Solution:

Verify the bucket name and AWS Region.

---

### Error

```
Error acquiring the state lock
```

Solution:

Check the DynamoDB table or remove a stale lock if no Terraform process is running.

---

# Interview Questions

1. What is a Terraform backend?
2. Why use Amazon S3 for Terraform state?
3. Why use DynamoDB?
4. What is state locking?
5. What happens if two engineers run `terraform apply` at the same time?
6. Why should Terraform state never be committed to Git?

---

# Next Step

Test the infrastructure, validate all AWS resources, and document the deployment.