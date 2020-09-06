output "master_ip_address" {
  value = hcloud_server_network.kube_master_network.ip
}

output "worker_ip_address" {
  value = hcloud_server_network.kube_worker_network.ip
}
