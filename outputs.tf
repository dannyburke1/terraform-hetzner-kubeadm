output "master_ip_address" {
  value = hcloud_server_network.kube_master_network[*].ip
}

output "worker_ip_address" {
  value = hcloud_server_network.kube_worker_network[*].ip
}

output "worker_ip_addresses" {
  value       = hcloud_server_network.kube_worker_network[*].ip
  description = "The Worker IPs addresses for all nodes"
}