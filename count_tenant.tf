resource "aci_tenant" "count_tenant" {
  count       = 4
  name        = "tenant_${count.index}"
  description = "Created with Terraform count"
}

resource "aci_vrf" "count_vrf" {
  count       = 4
  tenant_dn   = aci_tenant.count_tenant[count.index].id
  name        = "vrf_${count.index}"
  description = "Created with Terraform count"
}

resource "aci_any" "count_vzany" {
  count        = 4
  vrf_dn       = aci_vrf.count_vrf[count.index].id
  description  = "Created with Terraform count"
  pref_gr_memb = "enabled"
}

resource "aci_application_profile" "test_ap" {
  count       = 4
  tenant_dn   = aci_tenant.count_tenant[count.index].id
  name        = "ap_${count.index}"
  description = "Created with Terraform count"
}

resource "aci_application_epg" "count_epg" {
  count                  = 4
  application_profile_dn = aci_application_profile.test_ap[count.index].id
  name                   = "epg_${count.index}"
  description            = "Created with Terraform count"
  pref_gr_memb           = "include"
  relation_fv_rs_bd      = aci_bridge_domain.count_bd[count.index].id
}

resource "aci_bridge_domain" "count_bd" {
  count       = 4
  tenant_dn   = aci_tenant.count_tenant[count.index].id
  description = "Created with Terraform count"
  name        = "bd_${count.index}"
  arp_flood   = "yes"
}

resource "aci_subnet" "count_bd_subnet" {
  count       = 4
  parent_dn   = aci_bridge_domain.count_bd[count.index].id
  description = "Created with Terraform count"
  ip          = "10.${count.index}.${count.index}.1/24"
  scope       = ["public"]
}

