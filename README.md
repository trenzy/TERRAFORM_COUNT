## Teraform Count with ACI

In this directory, we are using the Terraform count meta-argument to 
use a whole number to create objects in ACI such as:
* Tenant
* VRF
* Bridge Domain
* Bridge Domain Subnets
* EPGs

This doesn't scale very well, especialy since chances are, you're not going to have tenant0, tenant1, etc.  The for_each meta-argument is better, but this is an example to show how this could be used.

The interesting thing is, we can create tenant0 and put vrf0 inside it along with bd0, epg0, etc. Again, we would not do this but it's a good exercise on how to use Terraform count.