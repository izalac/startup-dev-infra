terraform {
  required_providers {
    lxd = {
      source = "terraform-lxd/lxd"
      version = "2.4.0"
    }
  }
}

provider "lxd" {
}
