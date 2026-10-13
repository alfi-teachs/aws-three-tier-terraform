# Phase 2: Terraform Project Setup

## Objective

Prepare a clean, organized Terraform project for deploying a three-tier application on AWS.

## Project Structure

```text
aws-three-tier-terraform/
├── .github/
│   └── workflows/
├── app/
├── diagrams/
├── docs/
│   ├── 01-prerequisites/
│   └── 02-terraform-setup/
├── screenshots/
├── terraform/
├── .gitignore
└── README.md
```

## Folder Responsibilities

| Folder               | Purpose                                              |
| -------------------- | ---------------------------------------------------- |
| `terraform/`         | Terraform configuration files for AWS infrastructure |
| `app/`               | Application source code                              |
| `diagrams/`          | Architecture diagrams                                |
| `screenshots/`       | Project screenshots and evidence                     |
| `docs/`              | Step-by-step project documentation                   |
| `.github/workflows/` | GitHub Actions CI/CD workflows                       |

## Safety and Cost Management

* Keep Terraform state files and credentials out of Git.
* Review Terraform plans before applying changes.
* Avoid creating AWS resources until the configuration and expected costs have been reviewed.
* Destroy temporary resources when they are no longer needed.

## Completion Checklist

* [x] Created the main project folders.
* [x] Created the Phase 2 documentation file.
* [ ] Created the Terraform configuration files.
* [ ] Validated the Terraform configuration.
* [ ] Committed and pushed the completed phase.
