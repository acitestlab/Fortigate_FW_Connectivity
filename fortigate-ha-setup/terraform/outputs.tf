output "fortigate_primary_ip" {
  value = aws_instance.fortigate_primary.public_ip
}

output "fortigate_secondary_ip" {
  value = aws_instance.fortigate_secondary.public_ip
}

output "fortigate_primary_nic_id" {
  value = aws_network_interface.fortigate_primary_nic.id
}

output "fortigate_secondary_nic_id" {
  value = aws_network_interface.fortigate_secondary_nic.id
}