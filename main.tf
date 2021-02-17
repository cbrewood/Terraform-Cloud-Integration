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
  aws_side_as_number                = "64900"
  manage_vpc_attachment             = true
  manage_transit_gateway_attachment = true
  region                            = "eu-west-2"
  tgw_name                          = "eu-west-2-tgw"

  security_domains {
    connected_domains    = [
      "Default_Domain",
      "Shared_Service_Domain"
    ]
    security_domain_name = "Aviatrix_Edge_Domain"
  }

  security_domains {
    connected_domains    = [
      "Aviatrix_Edge_Domain",
      "Shared_Service_Domain"
    ]    
    security_domain_name = "Default_Domain"
  }

  security_domains {
    connected_domains    = [
      "Aviatrix_Edge_Domain",
      "Default_Domain"
    ]
    security_domain_name = "Shared_Service_Domain"
  }

  security_domains {
    connected_domains    = [
      "Aviatrix_Edge_Domain"
    ]
    security_domain_name = "sdn1"

    attached_vpc {
      vpc_account_name = "AWS_Automated"
      vpc_id           = "eu-west-2-vpc1"
      vpc_region       = "eu-west-2"
    }

    attached_vpc {
      vpc_account_name = "AWS_Automated"
      vpc_id           = "eu-west-2-vpc2"
      vpc_region       = "eu-west-2"
    }
  }
}