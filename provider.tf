terraform {
  required_providers {
    bigip = {
      source = "terraform-providers/bigip"
    }
  }
  required_version = ">= 0.13"
}

provider "bigip" {
  address  = var.address != "" ? var.address : var.F5_ADDRESS
  username = var.username != "" ? var.username : var.F5_USERNAME
  password = var.password != "" ? var.password : var.F5_PASSWORD
}
