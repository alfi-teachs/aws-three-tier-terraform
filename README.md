# AWS Three-Tier Architecture with Terraform

## Project Overview

Build a three-tier web application on AWS using Terraform.
This project demonstrates Infrastructure as Code (IaC), networking,
security, deployment, monitoring, and CI/CD.

## Architecture

### Tier 1: Presentation
- Application Load Balancer (ALB)
- Public subnets across Availability Zones

### Tier 2: Application
- Amazon EC2 instances
- Auto Scaling Group
- Private application subnets

### Tier 3: Database
- Amazon RDS for MySQL
- Private database subnets
- Restricted database access

## Technology Stack

- AWS
- Terraform
- Git and GitHub
- Linux and Bash
- Amazon VPC, EC2, ALB, and RDS
- IAM and security groups
- Amazon S3 for Terraform state
- Amazon CloudWatch
- GitHub Actions

## Implementation Plan

- [ ] Phase 1: Prerequisites and project setup
- [ ] Phase 2: VPC and networking
- [ ] Phase 3: IAM and security groups
- [ ] Phase 4: Load balancer and application tier
- [ ] Phase 5: Database and application integration
- [ ] Phase 6: Remote Terraform state
- [ ] Phase 7: GitHub Actions CI/CD
- [ ] Phase 8: Monitoring and security verification
- [ ] Phase 9: Testing and documentation
- [ ] Phase 10: AWS cleanup

## Security

- Never commit AWS credentials or passwords.
- Never commit Terraform state files.
- Use least-privilege IAM permissions.
- Keep application servers and the database in private subnets.
- Review Terraform plans before applying changes.

## Cost Management

AWS resources can incur charges while running. We will use
development-sized resources where practical and verify cleanup
after testing.

## Current Status

Project folders created. Documentation setup in progress.
No AWS infrastructure has been deployed.

## Learning Outcomes

- Build infrastructure using Terraform.
- Design a secure three-tier AWS architecture.
- Configure Terraform variables, outputs, and modules.
- Automate validation using GitHub Actions.
- Test application health and monitor AWS resources.
- Document deployment, troubleshooting, and cleanup.
