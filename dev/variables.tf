variable "region" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

variable "vpc_name" {
  type        = string

}

variable "ec2_name" {
  type        = string
}

variable "sg_name" {
  type        = string
}