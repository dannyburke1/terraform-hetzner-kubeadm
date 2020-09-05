# Hetzner Kubeadm cluster

### Why?

kubeadm lets you spin up Kubernetes cluster very easily with little effort, using these Terraform scripts and Hetzner cloud you can easily spin up a master and worker node in seconds with all of the required configuration.

### What do I need to do?

This module assumes that you have a public key in `~/.ssh/id_rsa.pub` and a Hetzner API token ready to be used.

Once you've updated the api key variable, you're ready to run `terraform apply` and spin up these nodes.

You can then SSH to the master with the `root` user and begin following the kubeadm cluster walkthrough. 

