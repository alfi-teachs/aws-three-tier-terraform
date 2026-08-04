# Terraform Setup

## Objective

The objective of this step is to configure Terraform so it can communicate with AWS and manage infrastructure as code.

In this step, we will create the following files:

- versions.tf
- provider.tf
- variables.tf
- terraform.tfvars

---

# Why These Files?

Terraform projects are usually divided into multiple files for better organization and maintainability.

| File | Purpose |
|------|---------|
| versions.tf | Defines the required Terraform and provider versions |
| provider.tf | Configures the AWS provider |
| variables.tf | Declares reusable input variables |
| terraform.tfvars | Stores values for input variables |

---

# Project Structure

```
aws-three-tier-terraform/

├── versions.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars
```

---

# Step 1 - Create versions.tf

This file defines the required Terraform version and AWS provider version.

```bash
terraform {

  required_version = ">= 1.5.0"

  required_providers {

    aws = {

      source  = "hashicorp/aws"

      version = "~> 6.0"

    }

  }

}
```

---

# Step 2 - Create provider.tf

This file tells Terraform which cloud provider to use and which AWS region to deploy resources in.
```bash
provider "aws" {

  region = var.aws_region

  default_tags {

    tags = {

      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"

    }

  }

}
```
---

# Step 3 - Create variables.tf

Variables make Terraform configurations reusable and easier to maintain.

Instead of hardcoding values, variables allow customization for different environments.

```bash
variable "aws_region" {

  description = "AWS Region"

  type = string

}

variable "project_name" {

  description = "Project Name"

  type = string

}

variable "environment" {

  description = "Environment"

  type = string

}
```

---

# Step 4 - Create terraform.tfvars

This file stores the actual values assigned to variables declared in variables.tf.

Keeping values separate from the configuration improves readability and flexibility.

```bash
aws_region  = "ap-south-1"

project_name = "aws-three-tier"

environment = "dev"
```

---

# Commands

Format Terraform files

```bash
terraform fmt
```

Initialize Terraform

```bash
terraform init
```

Validate Terraform configuration

```bash
terraform validate
```

---

# Expected Result

Terraform initializes successfully.

AWS provider plugins are downloaded.

The project is ready for creating AWS resources.

---

# Best Practices

- Keep provider configuration in a separate file.
- Never hardcode values directly into resources.
- Use variables whenever possible.
- Keep Terraform version pinned.
- Commit configuration files to Git.