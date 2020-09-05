resource "hcloud_server" "kube_worker_1" {
  name        = "worker-1"
  image       = var.os_image
  server_type = var.instance_type
  ssh_keys    = [hcloud_ssh_key.this.name]
}
