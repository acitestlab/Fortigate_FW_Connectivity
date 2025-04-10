variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
}

variable "gateway_subnet_prefix" {
  description = "Address prefix for the Gateway Subnet"
  type        = list(string)
}

variable "fortigate_public_ip" {
  description = "Public IP of the Fortigate firewall"
  type        = string
}

variable "fortigate_address_space" {
  description = "Address space of the Fortigate network"
  type        = list(string)
}

variable "shared_key" {
  description = "Shared key for the VPN connection"
  type        = string
}