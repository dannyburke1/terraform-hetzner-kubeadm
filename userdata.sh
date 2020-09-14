#!/bin/sh
swapoff -a 
sudo yum update -y && yum upgrade -y
sudo yum install -y wget

# Install ectd
wget https://github.com/etcd-io/etcd/releases/download/v3.3.12/etcd-v3.3.12-linux-amd64.tar.gz
tar xvf etcd-v3.3.12-linux-amd64.tar.gz
sudo mv etcd-v3.3.12-linux-amd64/etcd* /usr/local/bin

# Install Docker
yum install -y yum-utils device-mapper-persistent-data lvm2

yum-config-manager --add-repo \
  https://download.docker.com/linux/centos/docker-ce.repo

yum install -y containerd.io-1.2.13 docker-ce-19.03.11 docker-ce-cli-19.03.11 --skip-broken

mkdir /etc/docker

cat > /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2",
  "storage-opts": [
    "overlay2.override_kernel_check=true"
  ]
}
EOF

mkdir -p /etc/systemd/system/docker.service.d

# Install Kubernetes
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf 
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sudo sysctl --system 
cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kubelet kubeadm kubectl
EOF
sudo setenforce 0 
sudo sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config 
sudo yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes 

systemctl restart kubelet kubeadm kubectl docker
systemctl daemon-reload

sudo systemctl enable --now kubelet
sudo systemctl enable --now docker

rm -rf /home/*/.ssh/known_hosts
