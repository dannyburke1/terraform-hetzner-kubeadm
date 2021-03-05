module "hetzner_kubeadm" {
  source             =  "git@github.com:dannyburke1/hetzner-kubeadm.git"
  multi_master       = true
  master_node_count  = var.multi_master == "true" ? 3 : 1
  worker_node_count  = 6
  api_key            = "MY_KEY_HERE_PLEASE_KEEP_ME_SAFE"
}