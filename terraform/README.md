# Terraform Configuration

## Purpose

This directory contains the Terraform configuration for the AWS Three-Tier Infrastructure project.

## Files

| File                       | Purpose                                                    |
| -------------------------- | ---------------------------------------------------------- |
| `versions.tf`              | Specifies required Terraform and AWS provider versions     |
| `providers.tf`             | Configures the AWS provider, region, and local AWS profile |
| `variables.tf`             | Declares configurable project variables                    |
| `main.tf`                  | Defines reusable common resource tags                      |
| `outputs.tf`               | Defines project configuration outputs                      |
| `terraform.tfvars.example` | Provides example variable values                           |

## Prerequisites

* Terraform CLI installed
* AWS CLI installed
* AWS CLI profile named `terraform-user` configured locally
* Access to the AWS account and selected region

## Initialize Terraform

From the repository root, run:

```bash
terraform -chdir=terraform init
```

Initialization downloads the required provider and prepares the working directory.

## Format and Validate

Format the configuration:

```bash
terraform -chdir=terraform fmt -recursive
```

Validate the configuration:

```bash
terraform -chdir=terraform validate
```

## Safety

* Never commit AWS credentials or secret keys.
* Do not commit Terraform state files.
* Review configuration and plans before creating AWS resources.
* Confirm expected AWS costs before deployment.

**Current status:** Initial configuration only. No AWS infrastructure is defined for deployment yet.
