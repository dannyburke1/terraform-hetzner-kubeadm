provider "hcloud" {
  token = var.api_key
}

terraform {
  required_version = ">= 0.12.0"
}
