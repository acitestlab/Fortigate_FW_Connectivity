provider "fortinet" {
  # Configuration for Fortigate provider
  hostname = var.fortigate_hostname
  username = var.fortigate_username
  password = var.fortigate_password
}

resource "fortinet_firewall_policy" "ha_primary" {
  name        = "HA-Primary"
  srcintf    = var.primary_srcintf
  dstintf    = var.primary_dstintf
  action      = "accept"
  schedule    = "always"
  service     = ["ALL"]
  logtraffic  = "all"
}

resource "fortinet_firewall_policy" "ha_secondary" {
  name        = "HA-Secondary"
  srcintf    = var.secondary_srcintf
  dstintf    = var.secondary_dstintf
  action      = "accept"
  schedule    = "always"
  service     = ["ALL"]
  logtraffic  = "all"
}

resource "fortinet_system_interface" "ha_primary_interface" {
  name        = var.primary_interface_name
  ip          = var.primary_ip
  allowaccess = ["ping", "https", "ssh"]
}

resource "fortinet_system_interface" "ha_secondary_interface" {
  name        = var.secondary_interface_name
  ip          = var.secondary_ip
  allowaccess = ["ping", "https", "ssh"]
}

output "ha_primary_ip" {
  value = fortinet_system_interface.ha_primary_interface.ip
}

output "ha_secondary_ip" {
  value = fortinet_system_interface.ha_secondary_interface.ip
}