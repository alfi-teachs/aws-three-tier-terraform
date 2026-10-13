
# Phase 1: Prerequisites and Project Setup

## Objective
Prepare the local environment for the AWS Three-Tier Architecture project using Terraform.

## Verified Tools

| Tool | Version |
|---|---|
| Terraform | 1.14.3 |
| Git | 2.50.0 |
| AWS CLI | 2.33.6 |
| Docker Desktop | 4.94.0 |

## Project Location
`~/OneDrive/Desktop/lab/terraaform/aws-three-tier-terraform`

## Directory Structure
- `terraform/` - Terraform infrastructure configuration
- `app/` - Web application
- `docs/` - Project documentation
- `diagrams/` - Architecture diagrams
- `screenshots/` - Verification evidence
- `.github/workflows/` - GitHub Actions workflows

## Security
- Never commit AWS access keys, passwords, or Terraform state.
- Exclude local secrets from Git.
- Review Terraform plans before applying changes.
- Use least-privilege AWS permissions.

## Cost Management
No AWS infrastructure has been deployed during this phase.
Check estimated charges before creating billable resources.

## Completion Checklist
- [x] Terraform installed
- [x] Git installed
- [x] AWS CLI installed
- [ ] AWS profile verified
- [ ] Git repository initialized
- [ ] Documentation committed

## Status
Local tool installation is verified. AWS access and Git setup remain to be confirmed.
