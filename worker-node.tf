resource "hcloud_server" "kube_worker" {
  count       = var.worker_node_count
  name        = format("worker-%03d", count.index + 1)
  image       = var.os_image
  server_type = var.instance_type
  ssh_keys    = [hcloud_ssh_key.this.name]
  user_data   = file("${path.module}/userdata.sh")
}
