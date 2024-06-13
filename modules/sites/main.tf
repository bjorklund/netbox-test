terraform {
  required_providers {
    netbox = {
      source  = "e-breuninger/netbox"
      version = "~> 3.7"
    }
  }
}

resource "netbox_site" "STH-DC01" {
  name   = "STH-DC01"
  status = "active"
}
resource "netbox_site" "STH-DC02" {
  name   = "STH-DC02"
  status = "active"
}

output "netbox_site_STH-DC01_id" {
    value = netbox_site.STH-DC01.id
}
output "netbox_site_STH-DC02_id" {
    value = netbox_site.STH-DC02.id
}
