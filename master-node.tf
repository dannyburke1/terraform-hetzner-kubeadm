resource "hcloud_server" "kube_master" {
  name        = "master"
  image       = var.os_image
  server_type = var.instance_type
  ssh_keys    = [hcloud_ssh_key.this.name]
  user_data   = file("${path.module}/userdata.sh")
}
