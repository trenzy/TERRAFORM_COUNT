terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
    }
  }
}

/*
 Use variable substitution for APIC Username/Password and APIC IP. 
 Could use signature-based authentication as well.
*/

provider "aci" {
  # ACI Username
  username = var.APIC_USERNAME
  # ACI Password
  password = var.APIC_PASSWORD
  # cisco-aci url
  url      = var.APIC_URL
  insecure = true
}