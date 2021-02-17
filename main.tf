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

resource "aviatrix_vpc" "eu-west-2-vpc1" {
  cloud_type           = 1
  account_name         = "AWS_Automated"
  region               = "eu-west-2"
  name                 = "eu-west-2-vpc1"
  cidr                 = "10.100.0.0/16"
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = false
}

resource "aviatrix_vpc" "eu-west-2-vpc2" {
  cloud_type           = 1
  account_name         = "AWS_Automated"
  region               = "eu-west-2"
  name                 = "eu-west-2-vpc2"
  cidr                 = "10.101.0.0/16"
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = false
}

resource "aviatrix_aws_tgw" "eu-west-2-tgw" {
  account_name                      = "AWS_Automated"
  attached_aviatrix_transit_gateway = [
     "avx-transit-gw"
  ]