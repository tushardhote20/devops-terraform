variable "environment" {
  type = string
}

terraform {
  backend "s3" {
    bucket = "tusharbucket123.com"
    key    = "app/flipkart/${var.environment}/terraform.tfstate"
    region = "ap-south-1"
  }
}