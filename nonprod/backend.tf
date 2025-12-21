terraform {
  backend "s3" {
    bucket = "tusharbucket123.com"
    key    = "app/flipkart/nonprod/terraform.tfstate"
    region = "ap-south-1"
    
    #use_lockfile = "true"
  }
}
