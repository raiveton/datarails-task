variable "vpc_cidr_block" {
  type = string
  default = "192.168.0.0/16"
}

variable "region" {
  type = string
  default = "us-east-1"
}

variable "eks_name" {
  type = string
  default = "datarails-demo"
}

variable "instance_type" {
  type = string
  default = "t3.medium"
}
