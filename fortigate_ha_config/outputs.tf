output "dmz_interface_ip" {
  value = fortinet_system_interface.dmz.ip
}

output "internal_interface_ip" {
  value = fortinet_system_interface.internal.ip
}

output "external_interface_ip" {
  value = fortinet_system_interface.external.ip
}