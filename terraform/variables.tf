variable "region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "aws-devops-charity"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "az" {
  type    = string
  default = "us-east-1a"
}

variable "key_name" {
  type        = string
  description = "Existing EC2 key pair name in AWS (e.g., Charitykeypair)"
}

variable "ssh_cidr" {
  type        = string
  description = "Your trusted public IP in CIDR format, e.g. 197.210.77.31/32"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}
