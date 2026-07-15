#=============================================
# Project-1
# Purpose : Display Terraform Outputs
#=============================================
#=============================================
# VPC ID
#=============================================
output "vpc_id" {

  description = "VPC ID"

  value = aws_vpc.main.id

}
#=============================================
# Web Server Public IP
#=============================================

output "web_public_ip" {

  description = "Web Server Public IP"

  value = aws_instance.web_server.public_ip

}

#=============================================
# Web Server Public URL
#=============================================

output "web_public_url" {

  description = "Web Server Public URL"

  value = "http://${aws_instance.web_server.public_ip}"

}

#=============================================
# Database Server Private IP
#=============================================

output "db_private_ip" {

  description = "Database Server Private IP"

  value = aws_instance.database_server.private_ip

}