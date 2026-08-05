# Step 14 - Create Launch Template

## Objective

In this step, we will create an EC2 Launch Template.

A Launch Template stores the configuration required to launch EC2 instances.

Instead of manually creating EC2 instances, the Auto Scaling Group will use this Launch Template to automatically launch and replace instances.

---

# What is a Launch Template?

A Launch Template is a reusable configuration that defines how EC2 instances should be created.

It includes:

- Amazon Machine Image (AMI)
- Instance Type
- Security Group
- Key Pair
- User Data Script
- Tags

---

# Why Do We Need a Launch Template?

Without a Launch Template, every EC2 instance would need to be configured manually.

The Launch Template allows Auto Scaling to launch identical EC2 instances whenever needed.

---

# Architecture

Internet

↓

Application Load Balancer

↓

Target Group

↓

Auto Scaling Group

↓

Launch Template

↓

EC2 Instances

---

# Terraform File

autoscaling.tf
```bash
resource "aws_launch_template" "main" {

  name_prefix = "${var.project_name}-lt-"

  image_id = data.aws_ami.amazon_linux.id

  instance_type = var.instance_type

  key_name = var.key_name

  vpc_security_group_ids = [

    aws_security_group.ec2.id

  ]

  user_data = base64encode(file("user-data.sh"))

  update_default_version = true

  tag_specifications {

    resource_type = "instance"

    tags = {

      Name = "${var.project_name}-web"

    }

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
Git Commit
```bash
git add .

git commit -m "feat(asg): create launch template"
```
## Code Explanation

Image

image_id = data.aws_ami.amazon_linux.id

Uses the latest Amazon Linux 2023 AMI from the data source in ec2.tf.

Instance Type

instance_type = var.instance_type

Uses the value from terraform.tfvars.

Example:

instance_type = "t2.micro"

Key Pair

key_name = var.key_name

Allows you to connect to EC2 instances if needed.

Security Group

vpc_security_group_ids = [

  aws_security_group.ec2.id

]

Attaches the EC2 Security Group to every instance launched by the Auto Scaling Group.

User Data

user_data = base64encode(file("user-data.sh"))

Runs your startup script automatically when a new EC2 instance launches.

Terraform requires Launch Template User Data to be Base64 encoded.

Tags

tag_specifications {

  resource_type = "instance"

  tags = {

    Name = "${var.project_name}-web"

  }

}

Every EC2 instance launched from this template will receive the specified tag.
---

# Verification

AWS Console

↓

EC2

↓

Launch Templates

Verify:

- Launch Template exists
- Correct AMI
- Correct Instance Type
- Correct Security Group
- User Data attached

---

# Best Practices

- Use the latest Amazon Linux AMI.
- Store startup scripts in User Data.
- Reference Security Groups instead of hardcoding IDs.
- Use tags for easy resource identification.

---
Interview Questions

- What is a Launch Template?
- Why is a Launch Template used with an Auto Scaling Group?
- What configuration is stored in a Launch Template?
- Why is user_data Base64 encoded?
- Can multiple Auto Scaling Groups use the same Launch Template?
- What happens when you update a Launch Template?