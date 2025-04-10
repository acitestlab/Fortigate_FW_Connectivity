variable "vpn_name" {
  description = "The name of the VPN connection"
  type        = string
}

variable "fortigate_public_ip" {
  description = "The public IP address of the Fortigate HA firewall"
  type        = string
}

variable "aws_region" {
  description = "The AWS region where the VPN will be created"
  type        = string
}

variable "customer_gateway_ip" {
  description = "The public IP address of the customer gateway"
  type        = string
}

variable "vpn_type" {
  description = "The type of VPN connection (e.g., ipsec, openvpn)"
  type        = string
  default     = "ipsec"
}

variable "authentication_method" {
  description = "The authentication method for the VPN connection"
  type        = string
  default     = "pre-shared-key"
}

variable "pre_shared_key" {
  description = "The pre-shared key for the VPN connection"
  type        = string
}

variable "static_routes" {
  description = "List of static routes for the VPN connection"
  type        = list(string)
  default     = []
}