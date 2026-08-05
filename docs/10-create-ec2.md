# Step 10 - Launch EC2 Web Servers

## Objective

In this step, we will launch two Amazon EC2 instances inside the private subnets.

The EC2 instances will host our web application and receive traffic from the Application Load Balancer (ALB).

The web server software (Apache) will be installed automatically using a User Data script.

---

# What is Amazon EC2?

Amazon Elastic Compute Cloud (EC2) is a virtual server in AWS.

EC2 allows you to:

- Run Linux or Windows servers
- Host applications
- Install software
- Scale compute resources

---

# Why Private Subnets?

Our web servers should not be directly accessible from the Internet.

Instead:

Internet

↓

Application Load Balancer

↓

EC2 Instances

This improves security.

---

# Architecture

                    Internet
                        │
                 Application Load Balancer
                        │
        ┌───────────────┴───────────────┐
        │                               │
     EC2 Instance 1                 EC2 Instance 2
        │                               │
 Private Subnet 1                Private Subnet 2

---

# Terraform Files

- variable.tf
```bash
variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
}

variable "key_name" {
  description = "AWS Key Pair Name"
  type        = string
}
```
- terrafom.tfvars
```bash
instance_type = "t2.micro"

key_name = "terraform-key"
```

- ec2.tf
```bash
data "aws_ami" "amazon_linux" {

  most_recent = true

  owners = ["amazon"]

  filter {
    name = "name"
    values = ["al2023-ami-*-x86_64"]
  }

}
```

- user-data.sh
```bash
#!/bin/bash

yum update -y

yum install -y httpd

systemctl enable httpd

systemctl start httpd

TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" \
-H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" \
http://169.254.169.254/latest/meta-data/instance-id)

HOSTNAME=$(hostname)

cat <<EOF > /var/www/html/index.html

<html>
<head>
<title>AWS Three Tier Project</title>
</head>

<body style="font-family:Arial;text-align:center;margin-top:80px;">

<h1>AWS Three-Tier Infrastructure using Terraform</h1>

<h2>Apache Web Server is Running</h2>

<h3>Instance ID: $INSTANCE_ID</h3>

<h3>Hostname: $HOSTNAME</h3>

</body>

</html>

EOF
```
EC2 Instance 1

```bash
resource "aws_instance" "web1" {

  ami                    = data.aws_ami.amazon_linux.id

  instance_type          = var.instance_type

  subnet_id              = aws_subnet.private_subnet_1.id

  vpc_security_group_ids = [aws_security_group.ec2.id]

  key_name               = var.key_name

  user_data = file("user-data.sh")

  tags = {
    Name = "${var.project_name}-web-1"
  }

}
```
EC2 Instance 2

```bash
resource "aws_instance" "web2" {

  ami                    = data.aws_ami.amazon_linux.id

  instance_type          = var.instance_type

  subnet_id              = aws_subnet.private_subnet_2.id

  vpc_security_group_ids = [aws_security_group.ec2.id]

  key_name               = var.key_name

  user_data = file("user-data.sh")

  tags = {
    Name = "${var.project_name}-web-2"
  }

}
```


---

# Commands
```bash
terraform fmt

terraform plan

terraform apply 
```

---

# Verification

AWS Console

↓

EC2

↓

Instances

Verify:

- Two EC2 instances are running.
- Instances are in private subnets.
- Correct Security Group is attached.
- Apache is installed successfully.

---

# Best Practices

- Launch application servers in private subnets.
- Use Security Groups instead of public IPs.
- Automate configuration with User Data.
- Tag resources consistently.

---
Interview Questions
- Why are the EC2 instances placed in private subnets?
- What is User Data?
- What does file("user-data.sh") do?
- Why are we using a data source to fetch the AMI?
- Why don't these instances have public IP addresses?
- How will users access the application if the EC2 instances are private?
- Why do we launch instances in multiple Availability Zones?
--------

