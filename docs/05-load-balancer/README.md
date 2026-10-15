# Phase 5: Application Load Balancer

## Objective

Configure an internet-facing AWS Application Load Balancer using Terraform to distribute incoming HTTP traffic to application servers in private subnets.

## Architecture

Internet → ALB → EC2 Application Servers → RDS MySQL

## ALB Configuration

| Property | Value |
|---|---|
| Load Balancer Type | Application |
| Scheme | Internet-facing |
| Public Subnets | `aws_subnet.public_1`, `aws_subnet.public_2` |
| Security Group | `aws_security_group.alb` |
| Listener | HTTP, port 80 |
| Target Group | HTTP, port 3000 |
| Health Check | `/health` (planned) |

## Terraform Resources

- `aws_lb`
- `aws_lb_target_group`
- `aws_lb_listener`

## Security

- The ALB is placed in two public subnets across different Availability Zones.
- The ALB security group permits HTTP traffic on port 80.
- Application instances accept traffic only from the ALB security group.
- HTTPS will be considered in a later phase.

## Cost Awareness

An AWS Application Load Balancer incurs hourly and usage-based charges. No AWS resources will be deployed during local configuration and validation.

## Progress

- [ ] Create Application Load Balancer
- [ ] Create target group
- [ ] Create HTTP listener
- [ ] Add ALB outputs
- [ ] Validate Terraform configuration
- [ ] Commit and push Phase 5
