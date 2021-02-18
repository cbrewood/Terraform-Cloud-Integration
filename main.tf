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

resource "aviatrix_aws_peer" "eu-west-2-vpc1-vpc2" {
  account_name1 = "AWS_Automated"
  account_name2 = "AWS_Automated
  vpc_id1       = "eu-west-2-vpc1"
  vpc_id2       = "eu-west-2-vpc2"
  vpc_reg1      = "eu-west-2"
  vpc_reg2      = "eu-west-2"
  }
