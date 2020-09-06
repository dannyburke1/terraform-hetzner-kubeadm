resource "hcloud_network" "kube_network" {
  name     = "hetzner-kubeadm"
  ip_range = "10.0.0.0/16"
}

resource "hcloud_network_subnet" "subnet_pub" {
  network_id   = hcloud_network.kube_network.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.0.1.0/24"
}

resource "hcloud_server_network" "kube_master_network" {
  server_id  = hcloud_server.kube_master.id
  network_id = hcloud_network.kube_network.id
}

resource "hcloud_server_network" "kube_worker_network" {
  server_id  = hcloud_server.kube_worker_1.id
  network_id = hcloud_network.kube_network.id
}
