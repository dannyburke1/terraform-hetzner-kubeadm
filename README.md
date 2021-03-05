# Hetzner Kubeadm cluster

This Terraform module allows you to very easily spin up a Kubadm provisioned Kubernetes cluster on Hetzner Cloud. It creates one master node and one worker node.

### Why?

Kubeadm is covered a lot in the Kubernetes Certified Adminstrator exam [CKA](https://www.cncf.io/certification/cka/) - spinning up this cluster gives you practice for that exam and Kubernetes in general.

Kubeadm is used a lot in many productions for provisioning Kubernetes clusters in the cloud, on-prem, bare metal etc. 

[kubeadm](https://github.com/kubernetes/kubeadm)


### What do I need to do?

If you haven't already, setup an account at [Hetzner Sign Up](https://accounts.hetzner.com/account/masterdata)

You can call this module in your Terraform project like so:

```bash
module "hetzner_kubeadm" {
  source             =  "git@github.com:dannyburke1/hetzner-kubeadm.git"
  worker_node_count  = 6
  api_key            = "MY_KEY_HERE_PLEASE_KEEP_ME_SAFE"
}
```

This module assumes that you have a public key in `~/.ssh/id_rsa.pub` and a Hetzner API token ready to be used.

Once you've updated the api key variable, you're ready to run `terraform apply` and spin up these nodes.

You can then SSH to the master with the `root` user and begin following the kubeadm cluster walkthrough. 

### Costs

Kubeadm has resource requirements for it to run:
- 2GB Ram
- 2vCPU Cores for the master/control plane node.

This module has the correct instance sizes to run these instances with an estimated cost of:

8.38 euros p/month in Helsinki region for a master and control plane node.

# Multi Master Configuration now available

If you want to run multiple master nodes on your heznter cluster, you can enable it with the boolean:

```terraform
module "hetzner_kubeadm" {
  source             =  "git@github.com:dannyburke1/hetzner-kubeadm.git"
  multi_master       = true
  master_node_count  = var.multi_master == "true" ? 3 : 1
  worker_node_count  = 6
  api_key            = "MY_KEY_HERE_PLEASE_KEEP_ME_SAFE"
}
```

Read the docs here on how to configure multiple master nodes using Kubeadm: [Kubeadm Multi Master](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/high-availability/#steps-for-the-rest-of-the-control-plane-nodes)