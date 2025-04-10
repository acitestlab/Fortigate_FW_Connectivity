provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "vpn_vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_internet_gateway" "vpn_igw" {
  vpc_id = aws_vpc.vpn_vpc.id
}

resource "aws_subnet" "vpn_subnet" {
  vpc_id            = aws_vpc.vpn_vpc.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.availability_zone
}

resource "aws_customer_gateway" "fortigate_cgw" {
  bgp_asn    = 65000
  ip_address = var.fortigate_public_ip
  type       = "ipsec.1"
}

resource "aws_vpn_gateway" "vpn_gw" {
  vpc_id = aws_vpc.vpn_vpc.id
}

resource "aws_vpn_connection" "vpn_connection" {
  customer_gateway_id = aws_customer_gateway.fortigate_cgw.id
  vpn_gateway_id      = aws_vpn_gateway.vpn_gw.id
  type                = "ipsec.1"
  static_routes_only  = true

  tags = {
    Name = "FortigateToAWSVPN"
  }
}

resource "aws_vpn_connection_route" "vpn_route" {
  vpn_connection_id = aws_vpn_connection.vpn_connection.id
  destination_cidr_block = var.fortigate_address_space[0]
}