provider "hcloud" {
  token = var.api_key
}

terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.24.1"
    }
  }
  required_version = "0.14.7"
}
