terraform {
  required_providers {
    netbox = {
      source  = "e-breuninger/netbox"
      version = "~> 3.7"
    }
  }
}

variable "server_url" {
	type  = string
}
variable "api_token" {
	type  = string
}

provider "netbox" {
  server_url = var.server_url
  api_token  = var.api_token
}

resource "netbox_device_role" "Hypervisor" {
  name      = "Hypervisor"
  color_hex = "2a4478"
}
resource "netbox_device_role" "DBServer" {
  name      = "DBServer"
  color_hex = "784f3a"
}
resource "netbox_device_role" "Firewall" {
  name      = "Firewall"
  color_hex = "7a0406"
}
resource "netbox_device_role" "Core-Switch" {
  name      = "Core-Switch"
  color_hex = "13801c"
}

resource "netbox_manufacturer" "Fortinet" {
  name = "Fortinet"
}
resource "netbox_manufacturer" "HP" {
  name = "HP"
}

resource "netbox_device_type" "HPDL365" {
  model           = "DL 365"
  manufacturer_id = netbox_manufacturer.HP.id
  u_height = 1
}

resource "netbox_device_interface" "baset" {
  name      = "1000base-t"
  device_id = module.network.netbox_device_DC01-Firewall-1_id
  type      = "1000base-t"
}



module "sites" {
   source = "./modules/sites"
}
module "racks" {
   source = "./modules/racks"
   netbox_site_STH-DC01_id = module.sites.netbox_site_STH-DC01_id
   netbox_site_STH-DC02_id = module.sites.netbox_site_STH-DC02_id
}
module "network" {
   source = "./modules/network"
   netbox_site_STH-DC01_id = module.sites.netbox_site_STH-DC01_id
   netbox_site_STH-DC02_id = module.sites.netbox_site_STH-DC02_id

   netbox_rack_STH-DC01-R01_id = module.racks.netbox_rack_STH-DC01-R01_id
   netbox_rack_STH-DC01-R02_id = module.racks.netbox_rack_STH-DC01-R02_id
   netbox_rack_STH-DC02-R01_id = module.racks.netbox_rack_STH-DC02-R01_id
   netbox_rack_STH-DC02-R02_id = module.racks.netbox_rack_STH-DC02-R02_id

   netbox_device_role_Firewall_id = netbox_device_role.Firewall.id
   netbox_device_role_Core-Switch_id = netbox_device_role.Core-Switch.id

   netbox_manufacturer_Fortinet_id = netbox_manufacturer.Fortinet.id

}
module "servers" {
   source = "./modules/servers"
   netbox_device_type_HPDL365_id = netbox_device_type.HPDL365.id
   netbox_device_role_Hypervisor_id = netbox_device_role.Hypervisor.id
   netbox_device_role_DBServer_id = netbox_device_role.DBServer.id
   netbox_site_STH-DC01_id = module.sites.netbox_site_STH-DC01_id
   netbox_rack_STH-DC01-R01_id = module.racks.netbox_rack_STH-DC01-R01_id
   netbox_site_STH-DC02_id = module.sites.netbox_site_STH-DC02_id
   netbox_rack_STH-DC02-R01_id = module.racks.netbox_rack_STH-DC02-R01_id
}
module "cabling" {
   source = "./modules/cabling"
   netbox_device_interface_DC01-core-sw01-ports = module.network.netbox_device_interface_DC01-core-sw01-ports
   netbox_device_interface_DC01-core-sw02-ports = module.network.netbox_device_interface_DC01-core-sw02-ports

   netbox_device_interface_DC02-core-sw01-ports = module.network.netbox_device_interface_DC02-core-sw01-ports
   netbox_device_interface_DC02-core-sw02-ports = module.network.netbox_device_interface_DC02-core-sw02-ports

   netbox_device_interface_DC01-HWserver01_nics = module.servers.netbox_device_interface_DC01-HWserver01_nics
   netbox_device_interface_DC01-HWserver02_nics = module.servers.netbox_device_interface_DC01-HWserver02_nics
   netbox_device_interface_DC01-HWserver03_nics = module.servers.netbox_device_interface_DC01-HWserver03_nics
   netbox_device_interface_DC01-HWserver04_nics = module.servers.netbox_device_interface_DC01-HWserver04_nics
   netbox_device_interface_DC01-HWserver05_nics = module.servers.netbox_device_interface_DC01-HWserver05_nics

   netbox_device_interface_DC02-HWserver01_nics = module.servers.netbox_device_interface_DC02-HWserver01_nics
   netbox_device_interface_DC02-HWserver02_nics = module.servers.netbox_device_interface_DC02-HWserver02_nics
   netbox_device_interface_DC02-HWserver03_nics = module.servers.netbox_device_interface_DC02-HWserver03_nics
   netbox_device_interface_DC02-HWserver04_nics = module.servers.netbox_device_interface_DC02-HWserver04_nics
   netbox_device_interface_DC02-HWserver05_nics = module.servers.netbox_device_interface_DC02-HWserver05_nics

}
