terraform {
  required_providers {
    f5 = {
      source  = "f5devcentral/bigip"
      version = "~> 1.8"
    }
  }
}
provider "bigip" {
  address  = var.address
}


