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