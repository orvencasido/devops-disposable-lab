#!/bin/bash

set -e

#if ec2, disable swap
sudo swapoff -a
sudo sed -i '/ swap / s/^/#/' /etc/fstab


#[VM-1]install control plane 
curl -sfL https://get.k3s.io | sh -

#[VM-1]get control plane token 
sudo cat /var/lib/rancher/k3s/server/node-token

#[VM-1]change ip of vm-1 to private ip

#[VM-2]
curl -sfL https://get.k3s.io | \
K3S_URL=https://<PRIVATE-IP>:6443 \
K3S_TOKEN='<TOKEN>' \
sh -

#[VM-1] Change to Public Ip if ec2. no need if homelab
cat /etc/rancher/k3s/k3s.yaml

