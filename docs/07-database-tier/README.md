# Phase 7: Database Tier Design

## Objective

Document the database tier of the AWS three-tier architecture without provisioning a database.

## Planned Architecture

If implemented in a future deployment, the database tier would use Amazon RDS for MySQL in private database subnets across two Availability Zones.

## Security Design

- Database instances should not be publicly accessible.
- The database security group allows MySQL traffic on port 3306 only from the application security group.
- Database credentials must not be stored in source code or committed to Git.
- Database backups, encryption, and monitoring should be configured before production use.

## Current Scope

This phase documents the intended database architecture only.

- No RDS instance will be created.
- No database credentials are required.
- No database charges will be incurred while the database remains undeployed.

## Validation and Cost

The existing database security group is part of the Terraform configuration. This README does not create AWS resources.

## Progress Checklist

- [x] Document private database subnet design
- [x] Document database security requirements
- [x] Retain the existing database security group configuration
- [x] Confirm database deployment is out of scope
- [ ] Commit and push documentation to GitHub