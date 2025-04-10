provider "fortinet" {
  hostname = var.fortigate_hostname
  username = var.fortigate_username
  password = var.fortigate_password
}

resource "fortinet_system_interface" "dmz" {
  name        = "dmz"
  ip          = var.dmz_ip
  allowaccess = ["ping", "https", "ssh"]
}

resource "fortinet_system_interface" "internal" {
  name        = "internal"
  ip          = var.internal_ip
  allowaccess = ["ping", "https", "ssh"]
}

resource "fortinet_system_interface" "external" {
  name        = "external"
  ip          = var.external_ip
  allowaccess = ["ping", "https", "ssh"]
}

resource "fortinet_router_static" "default_route" {
  dst        = "0.0.0.0/0"
  gateway    = var.wan_router_ip
  device     = fortinet_system_interface.external.name
}

resource "fortinet_router_ospf" "ospf_config" {
  area = var.ospf_area

  network {
    prefix = var.dmz_ip
    area   = var.ospf_area
  }

  network {
    prefix = var.internal_ip
    area   = var.ospf_area
  }

  network {
    prefix = var.external_ip
    area   = var.ospf_area
  }
}

resource "fortinet_vpn_ipsec_phase1_interface" "vpn_azure" {
  name          = "VPN-to-Azure"
  interface     = var.external_interface
  remote_gw     = var.azure_gateway_ip
  psksecret     = var.psk
  proposal      = ["aes256-sha256"]
  dpd           = "on-idle"
  dpd_retryinterval = 10
}

resource "fortinet_vpn_ipsec_phase2_interface" "vpn_azure_phase2" {
  name          = "VPN-to-Azure-Phase2"
  phase1name    = fortinet_vpn_ipsec_phase1_interface.vpn_azure.name
  proposal      = ["aes256-sha256"]
  src_subnet    = var.local_subnet
  dst_subnet    = var.azure_subnet
}

resource "fortinet_firewall_policy" "vpn_policy" {
  name        = "VPN-to-Azure-Policy"
  srcintf     = [fortinet_system_interface.external.name]
  dstintf     = ["VPN-to-Azure"]
  srcaddr     = ["all"]
  dstaddr     = ["all"]
  action      = "accept"
  schedule    = "always"
  service     = ["ALL"]
  logtraffic  = "all"
}