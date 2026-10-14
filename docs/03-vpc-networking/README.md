# Phase 3: AWS VPC and Networking

## Objective

Create the networking foundation for an AWS three-tier application using Terraform.

## AWS Region

`ap-south-1` (Mumbai)

## Architecture

The network will use one VPC across two Availability Zones.

### Public Tier
- Two public subnets
- Internet Gateway
- Public route table
- Application Load Balancer (later phase)

### Application Tier
- Two private application subnets
- EC2 instances and Auto Scaling Group (later phase)

### Database Tier
- Two private database subnets
- Amazon RDS MySQL (later phase)

## Network CIDR Plan

| Resource | CIDR |
|---|---|
| VPC | 10.0.0.0/16 |
| Public Subnet 1 | 10.0.1.0/24 |
| Public Subnet 2 | 10.0.2.0/24 |
| Private App Subnet 1 | 10.0.11.0/24 |
| Private App Subnet 2 | 10.0.12.0/24 |
| Private DB Subnet 1 | 10.0.21.0/24 |
| Private DB Subnet 2 | 10.0.22.0/24 |

## Safety

- Run `terraform fmt` and `terraform validate` before deployment.
- Review `terraform plan` before applying changes.
- Do not create NAT Gateways or other billable infrastructure without reviewing costs.
- Run `terraform destroy` when deployed lab resources are no longer needed.

## Resources Configured

- [x] VPC
- [x] Two public subnets
- [x] Two private application subnets
- [x] Two private database subnets
- [x] Internet Gateway
- [x] Public route table and default internet route
- [x] Private application route table
- [x] Private database route table
- [x] Route table associations for all six subnets
- [x] Terraform formatting and validation

## Routing

- Public subnets use a route table with `0.0.0.0/0` directed to the Internet Gateway.
- Application and database subnets use separate route tables.
- Private route tables have no explicit default internet route at this stage.
- AWS automatically provides a local route for communication within the VPC.

## Cost and Security Notes

- No AWS resources have been deployed yet.
- No NAT Gateway has been configured.
- Private subnet routing and security controls must be reviewed before deployment.
- Review the Terraform plan and expected AWS costs before running `terraform apply`.

## Current Status

Terraform networking configuration is written and validated locally. Deployment has not been performed.
