provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "vpn_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.vpn_rg.location
  resource_group_name = azurerm_resource_group.vpn_rg.name
}

resource "azurerm_subnet" "gateway_subnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.vpn_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.gateway_subnet_prefix
}

resource "azurerm_public_ip" "vpn_gateway_ip" {
  name                = "vpnGatewayPublicIP"
  location            = azurerm_resource_group.vpn_rg.location
  resource_group_name = azurerm_resource_group.vpn_rg.name
  allocation_method   = "Dynamic"
}

resource "azurerm_virtual_network_gateway" "vpn_gateway" {
  name                = "vpnGateway"
  location            = azurerm_resource_group.vpn_rg.location
  resource_group_name = azurerm_resource_group.vpn_rg.name

  type     = "Vpn"
  vpn_type = "RouteBased"

  sku {
    tier = "VpnGw1"
  }

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.vpn_gateway_ip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gateway_subnet.id
  }
}

resource "azurerm_local_network_gateway" "fortigate_lng" {
  name                = "fortigateLocalNetworkGateway"
  location            = azurerm_resource_group.vpn_rg.location
  resource_group_name = azurerm_resource_group.vpn_rg.name

  gateway_address = var.fortigate_public_ip
  address_space   = var.fortigate_address_space
}

resource "azurerm_virtual_network_gateway_connection" "vpn_connection" {
  name                       = "fortigateToAzureVPN"
  location                   = azurerm_resource_group.vpn_rg.location
  resource_group_name        = azurerm_resource_group.vpn_rg.name
  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.vpn_gateway.id
  local_network_gateway_id   = azurerm_local_network_gateway.fortigate_lng.id
  shared_key                 = var.shared_key
}