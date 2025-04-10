resource "aws_vpn_gateway" "vpn_gateway" {
  vpc_id = var.vpc_id
  tags = {
    Name = "Fortigate-VPN-Gateway"
  }
}

resource "aws_customer_gateway" "customer_gateway" {
  bgp_asn    = var.bgp_asn
  ip_address = var.fortigate_public_ip
  type       = "ipsec.1"
  tags = {
    Name = "Fortigate-Customer-Gateway"
  }
}

resource "aws_vpn_connection" "vpn_connection" {
  vpn_gateway_id      = aws_vpn_gateway.vpn_gateway.id
  customer_gateway_id = aws_customer_gateway.customer_gateway.id
  type                = "ipsec.1"

  static_routes_only = true

  tags = {
    Name = "Fortigate-VPN-Connection"
  }
}

resource "aws_vpn_connection_route" "vpn_route" {
  vpn_connection_id = aws_vpn_connection.vpn_connection.id
  destination_cidr_block = var.remote_network_cidr
}

resource "aws_route" "vpn_route_to_remote" {
  route_table_id         = var.route_table_id
  destination_cidr_block = var.remote_network_cidr
  vpn_gateway_id         = aws_vpn_gateway.vpn_gateway.id
}