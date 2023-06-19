terraform {
  required_providers {
    bigip = {
      source = "f5devcentral/bigip"
    }
  }
  required_version = ">= 0.13"
}

provider "bigip" {
  address  = var.address
}


