# Phase 4: AWS Security Groups

## Objective

Configure security groups for the three-tier AWS architecture using Terraform, following least-privilege principles for inbound traffic.

## Architecture

Internet → Application Load Balancer → EC2 Application → RDS MySQL

## Security Group Configuration

| Security Group | Inbound Port | Protocol | Allowed Source |
|---|---|---|---|
| ALB | 80 | TCP | `0.0.0.0/0` |
| Application | 3000 | TCP | ALB security group |
| Database | 3306 | TCP | Application security group |

## Terraform Resources

- `aws_security_group.alb`
- `aws_security_group.app`
- `aws_security_group.db`

## Variables

| Variable | Default | Description |
|---|---|---|
| `app_port` | `3000` | Application listening port |
| `db_port` | `3306` | MySQL database port |

## Security Design

### ALB Security Group

Allows HTTP traffic from the internet on port 80.

### Application Security Group

Allows application traffic on port 3000 only from resources associated with the ALB security group.

### Database Security Group

Allows MySQL traffic on port 3306 only from resources associated with the application security group.

### Outbound Traffic

All three security groups currently permit outbound IPv4 traffic. Outbound permissions will be reviewed and restricted where practical in later phases.

## Validation

Run from the project root:

```bash
terraform -chdir=terraform fmt -recursive
terraform -chdir=terraform validate
```

Expected result:

`Success! The configuration is valid.`

## Security Considerations

- Database access is not exposed directly to the internet.
- Application inbound traffic is restricted to the ALB security group.
- HTTPS and TLS certificates are not yet configured.
- Security groups are stateful.
- Security groups alone do not establish internet connectivity; routing is also required.

## Deployment Safety

- Terraform configuration has been validated locally.
- No AWS resources have been deployed.
- Review `terraform plan` and expected AWS charges before applying.

## Progress

- [x] Create ALB security group
- [x] Create application security group
- [x] Create database security group
- [x] Configure application and database port variables
- [x] Format and validate Terraform
- [ ] Commit and push Phase 4 to GitHub
