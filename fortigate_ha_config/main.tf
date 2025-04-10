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