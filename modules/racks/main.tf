terraform {
  required_providers {
    netbox = {
      source  = "e-breuninger/netbox"
      version = "~> 3.7"
    }
  }
}


variable "netbox_site_STH-DC01_id" {
  type = string
  default = null
}
variable "netbox_site_STH-DC02_id" {
  type = string
  default = null
}

resource "netbox_rack" "STH-DC01-R01" {
  name     = "STH-DC01-R01"
  site_id  = var.netbox_site_STH-DC01_id
  status   = "reserved"
  width    = 19
  u_height = 47
}
resource "netbox_rack" "STH-DC01-R02" {
  name     = "STH-DC01-R02"
  site_id  = var.netbox_site_STH-DC01_id
  status   = "reserved"
  width    = 19
  u_height = 47
}

resource "netbox_rack" "STH-DC02-R01" {
  name     = "STH-DC01-R01"
  site_id  = var.netbox_site_STH-DC02_id
  status   = "reserved"
  width    = 19
  u_height = 47
}
resource "netbox_rack" "STH-DC02-R02" {
  name     = "STH-DC01-R02"
  site_id  = var.netbox_site_STH-DC02_id
  status   = "reserved"
  width    = 19
  u_height = 47
}

output "netbox_rack_STH-DC01-R01_id" {
    value = netbox_rack.STH-DC01-R01.id
}
output "netbox_rack_STH-DC01-R02_id" {
    value = netbox_rack.STH-DC01-R02.id
}
output "netbox_rack_STH-DC02-R01_id" {
    value = netbox_rack.STH-DC02-R01.id
}
output "netbox_rack_STH-DC02-R02_id" {
    value = netbox_rack.STH-DC02-R02.id
}
