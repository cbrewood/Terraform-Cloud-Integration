terraform {
  required_providers {
    aviatrix = {
      source = "AviatrixSystems/aviatrix"
      version = "2.18.0"
    }
  }
}

provider "aviatrix" {
}

resource "aviatrix_vpc" "eu-west-2_vpc1" {
  cloud_type           = 1
  account_name         = "devops"
  region               = "eu-west-2"
  name                 = "eu-west-2_vpc1"
  cidr                 = "10.100.0.0/16"
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = false
}

resource "aviatrix_vpc" "eu-west-2_vpc2" {
  cloud_type           = 1
  account_name         = "devops"
  region               = "eu-west-2"
  name                 = "eu-west-2_vpc2"
  cidr                 = "10.101.0.0/16"
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = false
}
