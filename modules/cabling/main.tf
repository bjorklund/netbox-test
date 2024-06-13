terraform {
  required_providers {
    netbox = {
      source  = "e-breuninger/netbox"
      version = "~> 3.7"
    }
  }
}


variable "netbox_device_interface_DC01-core-sw01-ports" {
  default = null
}
variable "netbox_device_interface_DC01-core-sw02-ports" {
  default = null
}
variable "netbox_device_interface_DC02-core-sw01-ports" {
  default = null
}
variable "netbox_device_interface_DC02-core-sw02-ports" {
  default = null
}

variable "netbox_device_interface_DC01-HWserver01_nics" {
  default = null
}
variable "netbox_device_interface_DC01-HWserver02_nics" {
  default = null
}
variable "netbox_device_interface_DC01-HWserver03_nics" {
  default = null
}
variable "netbox_device_interface_DC01-HWserver04_nics" {
  default = null
}
variable "netbox_device_interface_DC01-HWserver05_nics" {
  default = null
}

variable "netbox_device_interface_DC02-HWserver01_nics" {
  default = null
}
variable "netbox_device_interface_DC02-HWserver02_nics" {
  default = null
}
variable "netbox_device_interface_DC02-HWserver03_nics" {
  default = null
}
variable "netbox_device_interface_DC02-HWserver04_nics" {
  default = null
}
variable "netbox_device_interface_DC02-HWserver05_nics" {
  default = null
}


resource "netbox_cable" "A1001" {
  status      = "connected"
  label       = "A1001"
  type        = "dac-active"
  color_hex   = "123456"
  length      = 10
  length_unit = "m"
  a_termination {
    object_type = "dcim.interface"
    object_id   = var.netbox_device_interface_DC01-core-sw01-ports.0.id
  }
  b_termination {
    object_type = "dcim.interface"
    object_id   = var.netbox_device_interface_DC01-HWserver01_nics.0.id
  }
}
resource "netbox_cable" "A1002" {
  status      = "connected"
  label       = "A1002"
  type        = "dac-active"
  color_hex   = "123456"
  length      = 10
  length_unit = "m"
  a_termination {
    object_type = "dcim.interface"
    object_id   = var.netbox_device_interface_DC01-core-sw02-ports.0.id
  }
  b_termination {
    object_type = "dcim.interface"
    object_id   = var.netbox_device_interface_DC01-HWserver01_nics.1.id
  }
}

resource "netbox_cable" "A1003" {
  status      = "connected"
  label       = "A1003"
  type        = "dac-active"
  color_hex   = "123456"
  length      = 10
  length_unit = "m"
  a_termination {
    object_type = "dcim.interface"
    object_id   = var.netbox_device_interface_DC01-core-sw01-ports.1.id
  }
  b_termination {
    object_type = "dcim.interface"
    object_id   = var.netbox_device_interface_DC01-HWserver02_nics.0.id
  }
}
resource "netbox_cable" "A1004" {
  status      = "connected"
  label       = "A1004"
  type        = "dac-active"
  color_hex   = "123456"
  length      = 10
  length_unit = "m"
  a_termination {
    object_type = "dcim.interface"
    object_id   = var.netbox_device_interface_DC01-core-sw02-ports.1.id
  }
  b_termination {
    object_type = "dcim.interface"
    object_id   = var.netbox_device_interface_DC01-HWserver02_nics.1.id
  }
}



resource "netbox_cable" "A2001" {
  status      = "connected"
  label       = "A2001"
  type        = "dac-active"
  color_hex   = "123456"
  length      = 10
  length_unit = "m"
  a_termination {
    object_type = "dcim.interface"
    object_id   = var.netbox_device_interface_DC02-core-sw01-ports.0.id
  }
  b_termination {
    object_type = "dcim.interface"
    object_id   = var.netbox_device_interface_DC02-HWserver01_nics.0.id
  }
}
resource "netbox_cable" "A2002" {
  status      = "connected"
  label       = "A2002"
  type        = "dac-active"
  color_hex   = "123456"
  length      = 10
  length_unit = "m"
  a_termination {
    object_type = "dcim.interface"
    object_id   = var.netbox_device_interface_DC02-core-sw02-ports.1.id
  }
  b_termination {
    object_type = "dcim.interface"
    object_id   = var.netbox_device_interface_DC02-HWserver01_nics.1.id
  }
}


resource "netbox_cable" "A2003" {
  status      = "connected"
  label       = "A2003"
  type        = "dac-active"
  color_hex   = "123456"
  length      = 10
  length_unit = "m"
  a_termination {
    object_type = "dcim.interface"
    object_id   = var.netbox_device_interface_DC02-core-sw01-ports.1.id
  }
  b_termination {
    object_type = "dcim.interface"
    object_id   = var.netbox_device_interface_DC02-HWserver02_nics.0.id
  }
}

resource "netbox_cable" "A2004" {
  status      = "connected"
  label       = "A2004"
  type        = "dac-active"
  color_hex   = "123456"
  length      = 10
  length_unit = "m"
  a_termination {
    object_type = "dcim.interface"
    object_id   = var.netbox_device_interface_DC02-core-sw02-ports.0.id
  }
  b_termination {
    object_type = "dcim.interface"
    object_id   = var.netbox_device_interface_DC02-HWserver02_nics.1.id
  }
}
