provider "hcloud" {
  token = var.api_key
}

terraform {
  required_version = "0.13.2"
}
