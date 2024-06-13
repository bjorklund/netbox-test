terraform {
  required_providers {
    netbox = {
      source  = "e-breuninger/netbox"
      version = "~> 3.7"
    }
  }
}

variable "netbox_device_type_HPDL365_id" {
  type = string
  default = null
}

variable "netbox_device_role_Hypervisor_id" {
  type = string
  default = null
}
variable "netbox_device_role_DBServer_id" {
  type = string
  default = null
}

# DC01
variable "netbox_site_STH-DC01_id" {
  type = string
  default = null
}

variable "netbox_rack_STH-DC01-R01_id" {
  type = string
  default = null
}

# DC02
variable "netbox_site_STH-DC02_id" {
  type = string
  default = null
}

variable "netbox_rack_STH-DC02-R01_id" {
  type = string
  default = null
}

resource "netbox_device" "DC01-HWserver05" {
  name           = "DC01-HWserver05"
  device_type_id = var.netbox_device_type_HPDL365_id
  role_id        = var.netbox_device_role_DBServer_id
  site_id        = var.netbox_site_STH-DC01_id
  rack_id        = var.netbox_rack_STH-DC01-R01_id
  rack_position  = 14
  rack_face = "front"
}
resource "netbox_device_interface" "DC01-HWserver05_OOB" {
  name      = "DC01-HWserver 05 OOB"
  device_id = netbox_device.DC01-HWserver05.id
  type      = "1000base-t"
}
resource "netbox_device_interface" "DC01-HWserver05_nics" {
  device_id = netbox_device.DC01-HWserver05.id
  count = 4
  name = "nic${count.index +1}"
  type           = "25gbase-x-sfp28"
}

resource "netbox_device" "DC01-HWserver04" {
  name           = "DC01-HWserver04"
  device_type_id = var.netbox_device_type_HPDL365_id
  role_id        = var.netbox_device_role_Hypervisor_id
  site_id        = var.netbox_site_STH-DC01_id
  rack_id        = var.netbox_rack_STH-DC01-R01_id
  rack_position  = 15
  rack_face = "front"
}
resource "netbox_device_interface" "DC01-HWserver04_OOB" {
  name      = "DC01-HWserver04 OOB"
  device_id = netbox_device.DC01-HWserver04.id
  type      = "1000base-t"
}
resource "netbox_device_interface" "DC01-HWserver04_nics" {
  device_id = netbox_device.DC01-HWserver04.id
  count = 4
  name = "nic${count.index + 1}"
  type           = "25gbase-x-sfp28"
}

resource "netbox_device" "DC01-HWserver03" {
  name           = "DC01-HWserver03"
  device_type_id = var.netbox_device_type_HPDL365_id
  role_id        = var.netbox_device_role_Hypervisor_id
  site_id        = var.netbox_site_STH-DC01_id
  rack_id        = var.netbox_rack_STH-DC01-R01_id
  rack_position  = 16
  rack_face = "front"
}
resource "netbox_device_interface" "DC01-HWserver03_OOB" {
  name      = "DC01-HWserver03 OOB"
  device_id = netbox_device.DC01-HWserver03.id
  type      = "1000base-t"
}
resource "netbox_device_interface" "DC01-HWserver03_nics" {
  device_id = netbox_device.DC01-HWserver03.id
  count = 4
  name = "nic${count.index + 1}"
  type           = "25gbase-x-sfp28"
}

resource "netbox_device" "DC01-HWserver02" {
  name           = "DC01-HWserver02"
  device_type_id = var.netbox_device_type_HPDL365_id
  role_id        = var.netbox_device_role_Hypervisor_id
  site_id        = var.netbox_site_STH-DC01_id
  rack_id        = var.netbox_rack_STH-DC01-R01_id
  rack_position  = 17
  rack_face = "front"
}
resource "netbox_device_interface" "DC01-HWserver02_OOB" {
  name      = "DC01-HWserver04 OOB"
  device_id = netbox_device.DC01-HWserver02.id
  type      = "1000base-t"
}
resource "netbox_device_interface" "DC01-HWserver02_nics" {
  device_id = netbox_device.DC01-HWserver02.id
  count = 4
  name = "nic${count.index + 1}"
  type           = "25gbase-x-sfp28"
}

resource "netbox_device" "DC01-HWserver01" {
  name           = "DC01-HWserver01"
  device_type_id = var.netbox_device_type_HPDL365_id
  role_id        = var.netbox_device_role_Hypervisor_id
  site_id        = var.netbox_site_STH-DC01_id
  rack_id        = var.netbox_rack_STH-DC01-R01_id
  rack_position  = 18
  rack_face = "front"
}
resource "netbox_device_interface" "DC01-HWserver01_OOB" {
  name      = "DC01-HWserver01 OOB"
  device_id = netbox_device.DC01-HWserver01.id
  type      = "1000base-t"
}
resource "netbox_device_interface" "DC01-HWserver01_nics" {
  device_id = netbox_device.DC01-HWserver01.id
  count = 4
  name = "nic${count.index + 1}"
  type           = "25gbase-x-sfp28"
}

# DC02


resource "netbox_device" "DC02-HWserver05" {
  name           = "DC02-HWserver05"
  device_type_id = var.netbox_device_type_HPDL365_id
  role_id        = var.netbox_device_role_DBServer_id
  site_id        = var.netbox_site_STH-DC02_id
  rack_id        = var.netbox_rack_STH-DC02-R01_id
  rack_position  = 14
  rack_face = "front"
}
resource "netbox_device_interface" "DC02-HWserver05_OOB" {
  name      = "DC02-HWserver 05 OOB"
  device_id = netbox_device.DC02-HWserver05.id
  type      = "1000base-t"
}
resource "netbox_device_interface" "DC02-HWserver05_nics" {
  device_id = netbox_device.DC02-HWserver05.id
  count = 4
  name = "nic${count.index +1}"
  type           = "25gbase-x-sfp28"
}

resource "netbox_device" "DC02-HWserver04" {
  name           = "DC02-HWserver04"
  device_type_id = var.netbox_device_type_HPDL365_id
  role_id        = var.netbox_device_role_Hypervisor_id
  site_id        = var.netbox_site_STH-DC02_id
  rack_id        = var.netbox_rack_STH-DC02-R01_id
  rack_position  = 15
  rack_face = "front"
}
resource "netbox_device_interface" "DC02-HWserver04_OOB" {
  name      = "DC02-HWserver04 OOB"
  device_id = netbox_device.DC02-HWserver04.id
  type      = "1000base-t"
}
resource "netbox_device_interface" "DC02-HWserver04_nics" {
  device_id = netbox_device.DC02-HWserver04.id
  count = 4
  name = "nic${count.index + 1}"
  type           = "25gbase-x-sfp28"
}

resource "netbox_device" "DC02-HWserver03" {
  name           = "DC02-HWserver03"
  device_type_id = var.netbox_device_type_HPDL365_id
  role_id        = var.netbox_device_role_Hypervisor_id
  site_id        = var.netbox_site_STH-DC02_id
  rack_id        = var.netbox_rack_STH-DC02-R01_id
  rack_position  = 16
  rack_face = "front"
}
resource "netbox_device_interface" "DC02-HWserver03_OOB" {
  name      = "DC02-HWserver03 OOB"
  device_id = netbox_device.DC02-HWserver03.id
  type      = "1000base-t"
}
resource "netbox_device_interface" "DC02-HWserver03_nics" {
  device_id = netbox_device.DC02-HWserver03.id
  count = 4
  name = "nic${count.index + 1}"
  type           = "25gbase-x-sfp28"
}

resource "netbox_device" "DC02-HWserver02" {
  name           = "DC02-HWserver02"
  device_type_id = var.netbox_device_type_HPDL365_id
  role_id        = var.netbox_device_role_Hypervisor_id
  site_id        = var.netbox_site_STH-DC02_id
  rack_id        = var.netbox_rack_STH-DC02-R01_id
  rack_position  = 17
  rack_face = "front"
}
resource "netbox_device_interface" "DC02-HWserver02_OOB" {
  name      = "DC02-HWserver04 OOB"
  device_id = netbox_device.DC02-HWserver02.id
  type      = "1000base-t"
}
resource "netbox_device_interface" "DC02-HWserver02_nics" {
  device_id = netbox_device.DC02-HWserver02.id
  count = 4
  name = "nic${count.index + 1}"
  type           = "25gbase-x-sfp28"
}

resource "netbox_device" "DC02-HWserver01" {
  name           = "DC02-HWserver01"
  device_type_id = var.netbox_device_type_HPDL365_id
  role_id        = var.netbox_device_role_Hypervisor_id
  site_id        = var.netbox_site_STH-DC02_id
  rack_id        = var.netbox_rack_STH-DC02-R01_id
  rack_position  = 18
  rack_face = "front"
}
resource "netbox_device_interface" "DC02-HWserver01_OOB" {
  name      = "DC02-HWserver01 OOB"
  device_id = netbox_device.DC02-HWserver01.id
  type      = "1000base-t"
}
resource "netbox_device_interface" "DC02-HWserver01_nics" {
  device_id = netbox_device.DC02-HWserver01.id
  count = 4
  name = "nic${count.index + 1}"
  type           = "25gbase-x-sfp28"
}

output "netbox_device_interface_DC01-HWserver01_nics" {
    value = netbox_device_interface.DC01-HWserver01_nics
}
output "netbox_device_interface_DC01-HWserver02_nics" {
    value = netbox_device_interface.DC01-HWserver02_nics
}
output "netbox_device_interface_DC01-HWserver03_nics" {
    value = netbox_device_interface.DC01-HWserver03_nics
}
output "netbox_device_interface_DC01-HWserver04_nics" {
    value = netbox_device_interface.DC01-HWserver04_nics
}
output "netbox_device_interface_DC01-HWserver05_nics" {
    value = netbox_device_interface.DC01-HWserver05_nics
}


output "netbox_device_interface_DC02-HWserver01_nics" {
    value = netbox_device_interface.DC02-HWserver01_nics
}
output "netbox_device_interface_DC02-HWserver02_nics" {
    value = netbox_device_interface.DC02-HWserver02_nics
}
output "netbox_device_interface_DC02-HWserver03_nics" {
    value = netbox_device_interface.DC02-HWserver03_nics
}
output "netbox_device_interface_DC02-HWserver04_nics" {
    value = netbox_device_interface.DC02-HWserver04_nics
}
output "netbox_device_interface_DC02-HWserver05_nics" {
    value = netbox_device_interface.DC02-HWserver05_nics
}
