# Step 23 - AWS Architecture Diagram

## Objective

In this step, we will create an architecture diagram to visualize the AWS Three-Tier Infrastructure.

An architecture diagram helps explain how different AWS services interact and is commonly included in technical documentation, GitHub repositories, and design documents.

---

# Architecture Overview

The infrastructure consists of three logical layers:

- Presentation Layer
- Application Layer
- Database Layer

---

# AWS Three-Tier Architecture

```text
                                    Internet
                                        │
                                        │
                             Route 53 (Optional)
                                        │
                                        ▼
                      ┌────────────────────────────┐
                      │  Application Load Balancer │
                      └──────────────┬─────────────┘
                                     │
                             HTTP Listener (80)
                                     │
                                     ▼
                           ┌───────────────────┐
                           │   Target Group    │
                           └─────────┬─────────┘
                                     │
                      ┌──────────────┴──────────────┐
                      │                             │
                      ▼                             ▼
             ┌────────────────┐            ┌────────────────┐
             │ EC2 Instance 1 │            │ EC2 Instance 2 │
             │ Apache Server  │            │ Apache Server  │
             └───────┬────────┘            └───────┬────────┘
                     │                             │
                     └──────────────┬──────────────┘
                                    │
                           Auto Scaling Group
                                    │
                                    ▼
                          Amazon RDS MySQL
```

---

# Network Layout

```text
                        AWS Region
                            │
                 ┌─────────────────────┐
                 │        VPC          │
                 └──────────┬──────────┘
                            │
          ┌─────────────────┴─────────────────┐
          │                                   │
     Public Subnet A                    Public Subnet B
          │                                   │
      Load Balancer                      NAT Gateway
          │
          │
     Private Subnet A                  Private Subnet B
          │                                   │
       EC2 Instance                      EC2 Instance
                \                         /
                 \                       /
                  └────── Amazon RDS ───┘
```

---

# Components

## Networking

- VPC
- Public Subnets
- Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables

---

## Compute

- EC2
- Launch Template
- Auto Scaling Group

---

## Load Balancing

- Application Load Balancer
- Target Group
- HTTP Listener

---

## Database

- Amazon RDS MySQL

---

## Security

- Security Groups
- IAM

---

## Infrastructure as Code

- Terraform

---

# High Availability

This project is designed for high availability by:

- Deploying resources across multiple Availability Zones
- Using an Auto Scaling Group
- Using an Application Load Balancer
- Placing the database in private subnets

---

# Benefits

- High Availability
- Scalability
- Secure Network Design
- Infrastructure as Code
- Automated Provisioning
- Easy Maintenance

---

# Diagram Tools

You can create a professional architecture diagram using:

- diagrams.net (Draw.io)
- Lucidchart
- Cloudcraft
- Microsoft Visio

---

# Screenshot

Save the completed architecture diagram as:

```
screenshots/aws-three-tier-architecture.png
```

---

# Interview Questions

1. Explain the architecture of this project.
2. Why are EC2 instances deployed in private subnets?
3. What is the purpose of the Application Load Balancer?
4. Why is the RDS database deployed in private subnets?
5. How does the Auto Scaling Group improve availability?
6. What would you change for a production environment?

---

# Next Step

Prepare the project for interviews by reviewing common Terraform and AWS interview questions related to this architecture.