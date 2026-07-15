#==============================================
# Project-1
# Purpose : Create AWS Infrastructure
#==============================================
# Created Amazon VPC
#==============================================
resource "aws_vpc" "main" {

  cidr_block = var.vpc_cidr

  tags = {
    Name        = "${var.project_name}-${var.environment}-vpc"
    Environment = var.environment
    Owner       = var.owner
  }

}
#==============================================
# Created Public Subnet
#==============================================

resource "aws_subnet" "public" {

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.project_name}-${var.environment}-public-subnet"
    Environment = var.environment
    Owner       = var.owner
  }

}
#==============================================
# Created Private Subnet
#==============================================

resource "aws_subnet" "private" {

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.availability_zone

  tags = {
    Name        = "${var.project_name}-${var.environment}-private-subnet"
    Environment = var.environment
    Owner       = var.owner
  }

}
#==============================================
# Created Internet Gateway
#==============================================

resource "aws_internet_gateway" "igw" {

  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "${var.project_name}-${var.environment}-igw"
    Environment = var.environment
    Owner       = var.owner
  }

}
#==============================================
# Created Public Route Table
#==============================================

resource "aws_route_table" "public" {

  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "${var.project_name}-${var.environment}-public-rt"
    Environment = var.environment
    Owner       = var.owner
  }

}
#==============================================
# Created Route
#==============================================

resource "aws_route" "internet_access" {

  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id

}
#==============================================
# Associate Route Table with Public Subnet
#==============================================

resource "aws_route_table_association" "public" {

  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id

}
#==============================================
# Created Web Security Group
#==============================================

resource "aws_security_group" "web_sg" {

  name        = "${var.project_name}-${var.environment}-web-sg"
  description = "Security Group for Web Server"
  vpc_id      = aws_vpc.main.id

  # SSH Access
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.your_ip]
  }

  # HTTP Access
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound Access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-web-sg"
    Environment = var.environment
    Owner       = var.owner
  }

}
#==============================================
# Created Database Security Group
#==============================================

resource "aws_security_group" "db_sg" {

  name        = "${var.project_name}-${var.environment}-db-sg"
  description = "Security Group for Database Server"
  vpc_id      = aws_vpc.main.id

  # My SQL Access from Web Security Group
  ingress {
    description     = "My SQL from Web Server"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }

  # Outbound Access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-db-sg"
    Environment = var.environment
    Owner       = var.owner
  }

}
#==============================================
# Get Latest Amazon Linux 2 AMI
#==============================================

data "aws_ami" "amazon_linux" {

  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

}
#==============================================
# Created Web Server EC2
#==============================================

resource "aws_instance" "web_server" {

  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  user_data = file("userdata.sh")

  tags = {
    Name        = "${var.project_name}-${var.environment}-web-server"
    Environment = var.environment
    Owner       = var.owner
  }

}
#==============================================
# Created Database Server EC2
#==============================================

resource "aws_instance" "database_server" {

  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  key_name               = var.key_name
associate_public_ip_address = false

  tags = {
    Name        = "${var.project_name}-${var.environment}-database-server"
    Environment = var.environment
    Owner       = var.owner
  }

}