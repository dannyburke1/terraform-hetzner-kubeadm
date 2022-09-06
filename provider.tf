provider "hcloud" {
  token = var.api_key
}

terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.35.1"
    }
  }
  required_version = "1.2.8"
}
