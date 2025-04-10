output "fortigate_ha_ip" {
  value = aws_instance.fortigate_ha.private_ip
}

output "fortigate_ha_public_ip" {
  value = aws_instance.fortigate_ha.public_ip
}

output "fortigate_ha_status" {
  value = aws_instance.fortigate_ha.status
}