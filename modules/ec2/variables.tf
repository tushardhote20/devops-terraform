variable "ami_id" {}
variable "instance_type" { default = "t3.micro" }
variable "subnet_id" {}
variable "security_groups" { type = list(string) }
variable "user_data" { default = "" }
variable "tags" {
  type        = map(string)
}
