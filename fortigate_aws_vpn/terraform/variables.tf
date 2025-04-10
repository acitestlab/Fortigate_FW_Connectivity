variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
}

variable "availability_zone" {
  description = "AWS availability zone"
  type        = string
}

variable "fortigate_public_ip" {
  description = "Public IP of the Fortigate firewall"
  type        = string
}

variable "fortigate_address_space" {
  description = "Address space of the Fortigate network"
  type        = list(string)
}