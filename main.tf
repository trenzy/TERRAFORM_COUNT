terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
    }
  }
}

provider "aci" {
  # ACI Username
  username = var.APIC_USERNAME
  # ACI Password
  password = var.APIC_PASSWORD
  # cisco-aci url
  url      = var.APIC_URL
  insecure = true
}