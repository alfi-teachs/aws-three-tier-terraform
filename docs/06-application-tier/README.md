# Phase 6: Application Tier

## Objective

Design the application tier of the AWS three-tier architecture using Terraform.

The application tier is intended to run a containerized or web application on EC2 instances in private subnets.

## Planned Components

- EC2 launch template
- Auto Scaling Group
- Application instances in private subnets
- Application security group
- Integration with the Application Load Balancer target group
- Application health checks

## Traffic Flow

Browser → Application Load Balancer → Target Group → Application EC2 instances

## Security

- Application instances will use private subnets.
- The application security group will allow application traffic only from the ALB security group.
- No database is required for the application at this stage.
- SSH access should not be opened to the entire internet.

## Cost Considerations

EC2 instances and Auto Scaling resources may incur charges when deployed. This phase is configuration and documentation only.

No AWS resources will be created during this phase.

## Progress Checklist

- ## Progress Checklist

- [x] Document the application tier
- [x] Configure an EC2 launch template
- [x] Configure an Auto Scaling Group
- [x] Attach the Auto Scaling Group to the ALB target group
- [x] Validate Terraform locally
- [ ] Commit and push changes to GitHub

## Validation Notes

The Terraform configuration passed local validation using `terraform validate`.

No AWS resources have been deployed. The AMI ID must be supplied before planning or deployment, and the application health-check endpoint must be implemented and tested before the application is considered operational.

## Cost Considerations

The launch template and Auto Scaling Group can create billable EC2 resources when deployed. This project is currently configuration-only; no AWS infrastructure has been created.