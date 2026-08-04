# Prerequisites

Before deploying the AWS Three-Tier Infrastructure using Terraform, ensure that the required software is installed and your AWS account is configured correctly.

---

# System Requirements

| Software | Purpose |
|----------|---------|
| Git | Version Control |
| Visual Studio Code | Code Editor |
| Terraform | Infrastructure as Code |
| AWS CLI | Connect Terraform with AWS |
| GitHub Account | Source Code Repository |

---

# AWS Requirements

Before starting this project, make sure you have:

- AWS Account
- IAM User with Administrator Access (For Learning)
- AWS CLI Configured
- SSH Key Pair (Optional)

---

# Verify Software Installation

## Verify Git

```bash
git --version
```

Expected Output

```text
git version 2.x.x
```

---

## Verify Terraform

```bash
terraform version
```

Expected Output

```text
Terraform v1.x.x
```

---

## Verify AWS CLI

```bash
aws --version
```

Expected Output

```text
aws-cli/2.x.x
```

---

# Configure AWS CLI

Run:

```bash
aws configure
```

Enter:

```text
AWS Access Key ID
AWS Secret Access Key
Default Region
Default Output Format (json)
```

Example:

```text
AWS Access Key ID     : ****************
AWS Secret Access Key : ****************
Default region name   : ap-south-1
Default output format : json
```

---

# Verify AWS Credentials

Run:

```bash
aws sts get-caller-identity
```

Expected Output

```json
{
    "UserId": "XXXXXXXX",
    "Account": "123456789012",
    "Arn": "arn:aws:iam::123456789012:user/terraform-user"
}
```

---

# Verify Terraform

Initialize Terraform.

```bash
terraform init
```

Terraform should initialize successfully without errors.

---

# Recommended VS Code Extensions

- Terraform
- HashiCorp Terraform
- AWS Toolkit
- GitLens
- YAML
- Markdown All in One

---

# Recommended Folder Structure

```text
aws-three-tier-terraform/

├── docs/
├── modules/
├── screenshots/

├── provider.tf
├── versions.tf
├── variables.tf
├── terraform.tfvars

├── vpc.tf
├── subnet.tf
├── igw.tf
├── nat.tf
├── route-table.tf
├── security-group.tf
├── ec2.tf
├── alb.tf
├── autoscaling.tf
├── rds.tf

├── backend.tf
├── outputs.tf

├── user-data.sh

└── README.md
```

---

# Best Practices

- Never use the AWS Root User for Terraform.
- Create a dedicated IAM user for infrastructure provisioning.
- Store AWS credentials securely.
- Never commit secrets or access keys to GitHub.
- Keep Terraform files under version control using Git.
- Run `terraform fmt` before every commit.
- Run `terraform validate` before applying changes.

---

# Next Step

In the next section, we will configure Terraform by creating:

- `versions.tf`
- `provider.tf`
- `variables.tf`
- `terraform.tfvars`

These files will establish the Terraform version requirements, AWS provider configuration, input variables, and environment-specific values.