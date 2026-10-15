# Phase 9: GitHub Actions CI/CD

## Objective

Automate Terraform formatting and validation using GitHub Actions.

## Workflow File

`.github/workflows/terraform-ci.yml`

The workflow runs when code is pushed to the `main` branch or when a pull request targets `main`.

## Automated Checks

1. Check out the repository.
2. Set up Terraform.
3. Check formatting using `terraform fmt -check -recursive`.
4. Initialize Terraform without a remote backend using `terraform init -backend=false`.
5. Validate the Terraform configuration using `terraform validate`.

## Security and Cost

- No AWS credentials are required for these checks.
- The workflow does not create AWS resources.
- The workflow does not run `terraform apply`.
- GitHub Actions usage is subject to the applicable account limits and pricing.

## Progress Checklist

- [x] Create GitHub Actions workflow
- [x] Configure Terraform setup
- [x] Add formatting check
- [x] Add initialization without a backend
- [x] Add Terraform validation
- [x] Verify local Terraform checks
- [ ] Commit and push changes to GitHub
- [ ] Confirm workflow result in GitHub Actions