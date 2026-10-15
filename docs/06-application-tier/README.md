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

- [ ] Document the application tier
- [ ] Configure an EC2 launch template
- [ ] Configure an Auto Scaling Group
- [ ] Attach the Auto Scaling Group to the ALB target group
- [ ] Validate Terraform locally
- [ ] Commit and push changes to GitHub