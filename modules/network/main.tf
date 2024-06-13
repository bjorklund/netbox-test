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
variable "netbox_rack_STH-DC01-R01_id" {
  type = string
  default = null
}
variable "netbox_rack_STH-DC01-R02_id" {
  type = string
  default = null
}
variable "netbox_rack_STH-DC02-R01_id" {
  type = string
  default = null
}
variable "netbox_rack_STH-DC02-R02_id" {
  type = string
  default = null
}
variable "netbox_device_role_Firewall_id" {
  type = string
  default = null
}
variable "netbox_device_role_Core-Switch_id" {
  type = string
  default = null
}

variable "netbox_manufacturer_Fortinet_id" {
  type = string
  default = null
}

resource "netbox_device_type" "Fortigate_3000F" {
  model           = "Fortigate 3000F"
  manufacturer_id = var.netbox_manufacturer_Fortinet_id
  u_height = 2
}
resource "netbox_device_type" "Fortigate_FS-2048F" {
  model           = "Fortigate FS-2048F"
  manufacturer_id = var.netbox_manufacturer_Fortinet_id
  u_height = 1
}


resource "netbox_device" "DC01-Firewall-1" {
  name           = "DC01-Firewall-1"
  device_type_id = netbox_device_type.Fortigate_3000F.id
  role_id        = var.netbox_device_role_Firewall_id
  site_id        = var.netbox_site_STH-DC01_id
  rack_id        = var.netbox_rack_STH-DC01-R01_id
  rack_position  = 20
  rack_face = "front"
  local_context_data = jsonencode({
    "setting_a" = "Some Setting"
    "setting_b" = 42
  })
}
resource "netbox_device" "DC01-core-sw01" {
  name           = "DC01-core-sw01"
  device_type_id = netbox_device_type.Fortigate_FS-2048F.id
  role_id        = var.netbox_device_role_Core-Switch_id
  site_id        = var.netbox_site_STH-DC01_id
  rack_id        = var.netbox_rack_STH-DC01-R01_id
  rack_position  = 22
  rack_face = "front"
}
resource "netbox_device_interface" "DC01-core-sw01-ports" {
  device_id = netbox_device.DC01-core-sw01.id
  count = 32
  name = "25g-ether/${count.index +1}"
  type           = "25gbase-x-sfp28"
}

resource "netbox_device" "DC01-core-sw02" {
  name           = "DC01-core-sw02"
  device_type_id = netbox_device_type.Fortigate_FS-2048F.id
  role_id        = var.netbox_device_role_Core-Switch_id
  site_id        = var.netbox_site_STH-DC01_id
  rack_id        = var.netbox_rack_STH-DC01-R01_id
  rack_position  = 23
  rack_face = "front"
}
resource "netbox_device_interface" "DC01-core-sw02-ports" {
  device_id = netbox_device.DC01-core-sw02.id
  count = 32
  name = "25g-ether/${count.index +1}"
  type           = "25gbase-x-sfp28"
}


resource "netbox_device" "DC02-Firewall-1" {
  name           = "DC02-Firewall-1"
  device_type_id = netbox_device_type.Fortigate_3000F.id
  role_id        = var.netbox_device_role_Firewall_id
  site_id        = var.netbox_site_STH-DC02_id
  rack_id        = var.netbox_rack_STH-DC02-R01_id
  rack_position  = 20
  rack_face = "front"
  local_context_data = jsonencode({
    "setting_a" = "Some Setting"
    "setting_b" = 42
  })
}
resource "netbox_device" "DC02-core-sw01" {
  name           = "DC02-core-sw01"
  device_type_id = netbox_device_type.Fortigate_FS-2048F.id
  role_id        = var.netbox_device_role_Core-Switch_id
  site_id        = var.netbox_site_STH-DC02_id
  rack_id        = var.netbox_rack_STH-DC02-R01_id
  rack_position  = 22
  rack_face = "front"
}
resource "netbox_device_interface" "DC02-core-sw01-ports" {
  device_id = netbox_device.DC02-core-sw01.id
  count = 32
  name = "25g-ether/${count.index +1}"
  type           = "25gbase-x-sfp28"
}

resource "netbox_device" "DC02-core-sw02" {
  name           = "DC02-core-sw02"
  device_type_id = netbox_device_type.Fortigate_FS-2048F.id
  role_id        = var.netbox_device_role_Core-Switch_id
  site_id        = var.netbox_site_STH-DC02_id
  rack_id        = var.netbox_rack_STH-DC02-R01_id
  rack_position  = 23
  rack_face = "front"
}
resource "netbox_device_interface" "DC02-core-sw02-ports" {
  device_id = netbox_device.DC02-core-sw02.id
  count = 32
  name = "25g-ether/${count.index +1}"
  type           = "25gbase-x-sfp28"
}



output "netbox_device_type_Fortigate_3000F_id" {
    value = netbox_device_type.Fortigate_3000F.id
}
output "netbox_device_type_Fortigate_FS-2048F_id" {
    value = netbox_device_type.Fortigate_FS-2048F.id
}

output "netbox_device_DC01-Firewall-1_id" {
    value = netbox_device.DC01-Firewall-1.id
}
output "netbox_device_DC02-Firewall-1_id" {
    value = netbox_device.DC02-Firewall-1.id
}
output "netbox_device_interface_DC01-core-sw01-ports" {
    value = netbox_device_interface.DC01-core-sw01-ports
}
output "netbox_device_interface_DC01-core-sw02-ports" {
    value = netbox_device_interface.DC01-core-sw02-ports
}
output "netbox_device_interface_DC02-core-sw01-ports" {
    value = netbox_device_interface.DC02-core-sw01-ports
}
output "netbox_device_interface_DC02-core-sw02-ports" {
    value = netbox_device_interface.DC02-core-sw02-ports
}

