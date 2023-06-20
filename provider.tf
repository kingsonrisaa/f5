terraform {
  required_providers {
    bigip = {
      source = "terraform-providers/bigip"
    }
  }
  required_version = ">= 0.13"
}

provider "bigip" {
  address  = var.address
  F5_USERNAME = var.f5_username
  F5_PASSWORD = var.f5_password  
}
