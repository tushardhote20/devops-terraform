provider "aws" {
  region = var.region
}

#--------------------------- VPC MODULE ---------------------------

module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  azs                  = var.azs

  tags = {
    Name = var.vpc_name
  }
}

# --------------------------- SECURITY GROUPS ---------------------------

resource "aws_security_group" "app_sg" {
  name        = "app-sg"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg_name
  }
}

# --------------------------- EC2 MODULE ---------------------------

module "ec2" {
  source          = "./modules/ec2"
  ami_id          = var.ami_id
  instance_type   = "t3.micro"
  subnet_id       = module.vpc.public_subnets[0]
  security_groups = [aws_security_group.app_sg.id]
  user_data       = file("user_data.sh")

  tags = {
    Name = var.ec2_name
  }
}
