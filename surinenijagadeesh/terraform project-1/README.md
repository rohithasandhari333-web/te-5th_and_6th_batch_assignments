# Project-1
## 2-Tier Web Application Infrastructure on AWS using Terraform
This project provisions a simple 2-Tier Web Application Infrastructure on AWS using Terraform. It creates the required networking components, security groups, EC2 instances, and a remote backend for Terraform state management.
---
## Architecture
Internet
│
▼
Internet Gateway
│
▼
Public Subnet
│
▼
Web Server (Apache)
│
▼
Security Group
│
▼
Private Subnet
│
▼
Database Server (Private EC2)
---
## Resources Created
- Amazon VPC
- Public Subnet
- Private Subnet
- Internet Gateway
- Route Table
- Route Table Association
- Web Security Group
- Database Security Group
- Web Server (EC2)
- Database Server (EC2)
- S3 Remote Backend with State Locking
---
## Project Structure

----
project-1/
│
├── provider.tf
├── backend.tf
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── userdata.sh
├── index.html
└── README.md

---

## Features

- Infrastructure as Code using Terraform
- Remote Backend using Amazon S3
- State Locking using `use_lockfile = true`
- Reusable variables with `terraform.tfvars`
- Public and Private Subnets
- Apache Web Server installed using `user_data`
- Outputs for VPC ID, Public IP, Public URL and Database Private IP
- Resource Tagging (Name, Environment, Owner)

---
## Terraform Commands
 ```bash
terraform fmt
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy
```
---
## Outputs
After successful deployment Terraform displays:
- vpc_id
- web_public_ip
- web_public_url
- db_private_ip
---
## Screenshots
- Terraform Apply
- AWS Resources
- Website
- State Locking
- Terraform Destroy
---
## Created By
**Jagadeesh Surineni**
---
## Mentored By
**Shiva Pothula**