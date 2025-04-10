variable "fortigate_primary_ip" {
  description = "The primary IP address of the Fortigate firewall"
  type        = string
}

variable "fortigate_secondary_ip" {
  description = "The secondary IP address of the Fortigate firewall"
  type        = string
}

variable "fortigate_ami" {
  description = "The AMI ID for the Fortigate image"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the Fortigate firewall"
  type        = string
}

variable "allowed_ips" {
  description = "List of allowed IP addresses for ingress rules"
  type        = list(string)
}

variable "subnet_id" {
  description = "The subnet ID where the Fortigate instances will be deployed"
  type        = string
}

variable "aws_region" {
  description = "The AWS region to deploy the resources"
  type        = string
}