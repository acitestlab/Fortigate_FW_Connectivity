output "vpn_connection_id" {
  description = "The ID of the VPN connection"
  value       = aws_vpn_connection.example.id
}

output "vpn_public_ip" {
  description = "The public IP address of the Fortigate HA firewall"
  value       = aws_instance.fortigate.public_ip
}

output "vpn_customer_gateway_id" {
  description = "The ID of the customer gateway"
  value       = aws_customer_gateway.example.id
}

output "vpn_tunnel1_address" {
  description = "The address of the first VPN tunnel"
  value       = aws_vpn_connection.example.tunnel1_address
}

output "vpn_tunnel2_address" {
  description = "The address of the second VPN tunnel"
  value       = aws_vpn_connection.example.tunnel2_address
}