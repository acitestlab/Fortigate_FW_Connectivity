resource_group_name = "FortigateAzureVPNRG"
location            = "East US"
vnet_name           = "FortigateAzureVNet"
vnet_address_space  = ["10.0.0.0/16"]
gateway_subnet_prefix = ["10.0.1.0/24"]
fortigate_public_ip = "203.0.113.1"
fortigate_address_space = ["192.168.1.0/24"]
shared_key          = "YourSharedKeyHere"