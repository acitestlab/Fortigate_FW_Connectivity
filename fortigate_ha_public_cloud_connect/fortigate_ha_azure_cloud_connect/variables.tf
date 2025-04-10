variable "fortigate_hostname" {
  description = "Fortigate hostname"
  type        = string
}

variable "fortigate_username" {
  description = "Fortigate username"
  type        = string
}

variable "fortigate_password" {
  description = "Fortigate password"
  type        = string
}

variable "dmz_ip" {
  description = "IP address for the DMZ interface"
  type        = string
}

variable "internal_ip" {
  description = "IP address for the internal interface"
  type        = string
}

variable "external_ip" {
  description = "IP address for the external interface"
  type        = string
}

variable "wan_router_ip" {
  description = "IP address of the WAN router"
  type        = string
}

variable "ospf_area" {
  description = "OSPF area"
  type        = string
}

variable "external_interface" {
  description = "External interface name"
  type        = string
}

variable "azure_gateway_ip" {
  description = "Azure VPN Gateway IP"
  type        = string
}

variable "psk" {
  description = "Pre-shared key for VPN"
  type        = string
}

variable "local_subnet" {
  description = "Local subnet for the Fortigate firewall"
  type        = string
}

variable "azure_subnet" {
  description = "Azure subnet for the VPN"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}

