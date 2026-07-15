#==========================================
# AWS Configuration
#==========================================
region = "ap-south-1"
#==========================================
# Project Information
#==========================================
project_name = "terraform-project"
environment  = "dev"
owner        = "Jagadeesh Surineni"
#==========================================
# Network Configuration
#==========================================
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"
availability_zone   = "ap-south-1a"
#==========================================
# EC2 Configuration
#==========================================
instance_type = "t3.micro"
key_name      = "terraform-project-key"
#==========================================
# Security
#==========================================
your_ip = "103.208.231.57/32"