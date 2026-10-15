# AWS Three-Tier Architecture with Terraform

A hands-on DevOps portfolio project focused on designing AWS infrastructure using Terraform and automating configuration checks with GitHub Actions.

**Status:** Terraform configuration and documentation completed through the final review phase. No AWS resources have been deployed.

## Project Overview

This project demonstrates how to define a three-tier AWS architecture as Infrastructure as Code (IaC). It covers network design, security groups, load balancing, application-tier scaling, remote-state planning, and automated Terraform validation.

The project is intended for learning and portfolio presentation. Live AWS deployment and end-to-end infrastructure testing have not been performed.


## Technology Stack

- AWS and Amazon VPC
- Terraform
- Git and GitHub
- GitHub Actions
- EC2 launch templates and Auto Scaling Groups
- Application Load Balancer and target groups
- Terraform variables, outputs, and provider configuration
- AWS security groups and route tables

## Work Completed

- Created and organized the Terraform project structure.
- Defined the VPC and six subnet configurations across two Availability Zones.
- Configured the Internet Gateway, route tables, and subnet associations in Terraform.
- Defined separate security groups for the load balancer, application tier, and database tier.
- Defined the Application Load Balancer, listener, and target group.
- Defined the EC2 launch template and Auto Scaling Group.
- Added Terraform variables, outputs, provider requirements, and version constraints.
- Documented database-tier design and remote-state considerations.
- Created a GitHub Actions workflow for Terraform formatting, initialization without a backend, and validation.
- Created phase-by-phase documentation.

## Validation

The following checks have succeeded:

- `terraform fmt -check -recursive`
- `terraform init -backend=false`
- `terraform validate`
- GitHub Actions **Terraform CI** workflow

[View GitHub Actions](https://github.com/alfi-teachs/aws-three-tier-terraform/actions)

These checks validate the configuration; they do not confirm successful deployment or operation in AWS.

## Repository Structure

```text
aws-three-tier-terraform/
├── .github/workflows/
│   └── terraform-ci.yml
├── docs/
│   ├── 01-prerequisites/
│   ├── 02-terraform-setup/
│   ├── 03-vpc-networking/
│   ├── 04-security-groups/
│   ├── 05-load-balancer/
│   ├── 06-application-tier/
│   ├── 07-database-tier/
│   ├── 08-remote-state/
│   ├── 09-github-actions/
│   └── 10-final-review/
└── terraform/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    ├── providers.tf
    ├── versions.tf
    ├── terraform.tfvars.example
    └── README.md
```

## Not Yet Implemented or Verified

- RDS MySQL resource creation and application-to-database integration
- Remote S3 backend configuration and initialization
- CloudWatch monitoring and alarms
- Live application health checks and end-to-end tests
- Deployment to AWS

Before any future deployment, the AMI, application health-check path, and private-subnet access to packages and container images must be reviewed.

## Security and Cost

- No AWS infrastructure has been deployed.
- AWS credentials and secrets must never be committed to the repository.
- Terraform state and saved plan files must remain out of version control.
- A future deployment must include an IAM, security, and cost review.
- Services such as EC2, ALB, RDS, and NAT Gateway can incur charges if provisioned.

## Documentation

See the [`docs/`](docs/) directory for the detailed steps and explanations for each project phase.

## Disclaimer

This is a learning and portfolio project. The Terraform configuration has passed formatting and validation checks but has not been tested through a live AWS deployment. Further engineering and verification may be required before production use.