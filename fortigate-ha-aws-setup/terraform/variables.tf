variable "fortigate_primary_ip" {
  description = "Primary IP address of the Fortigate firewall"
  type        = string
}

variable "fortigate_secondary_ip" {
  description = "Secondary IP address of the Fortigate firewall"
  type        = string
}

variable "fortigate_admin_password" {
  description = "Admin password for the Fortigate firewall"
  type        = string
  sensitive   = true
}

variable "fortigate_vdom" {
  description = "VDOM name for the Fortigate configuration"
  type        = string
  default     = "root"
}

variable "fortigate_ha_mode" {
  description = "HA mode for the Fortigate firewall (active-active or active-passive)"
  type        = string
  default     = "active-passive"
}

variable "fortigate_region" {
  description = "Region for the Fortigate deployment"
  type        = string
}