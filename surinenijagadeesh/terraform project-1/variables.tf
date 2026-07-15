#==========================================
# AWS Configuration
#==========================================
variable "region" {
  description = "AWS Region"
  type        = string
}
#==========================================
# Project Information
#===========================================
variable "project_name" {
  description = "Project Name"
  type        = string
}
variable "environment" {
  description = "Environment Name"
  type        = string
}
variable "owner" {
  description = "Resource Owner"
  type        = string
}
#===========================================
# Network Configuration
#============================================
variable "vpc_cidr" {
  description = "VPC CIDR Block"
  type        = string
}
variable "public_subnet_cidr" {
  description = "Public Subnet CIDR"
  type        = string
}
variable "private_subnet_cidr" {
  description = "Private Subnet CIDR"
  type        = string
}
variable "availability_zone" {
  description = "Availability Zone"
  type        = string
}
#=============================================
# EC2 Configuration
#==============================================
variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
}
variable "key_name" {
  description = "AWS Key Pair Name"
  type        = string
}
#==============================================
# Security
#=============================================
variable "your_ip" {
  description = "Your Public IP"
  type        = string
}