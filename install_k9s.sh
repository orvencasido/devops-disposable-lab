#!/bin/bash

set -e
 
curl -sS https://webinstall.dev/k9s | bash

source ~/.config/envman/PATH.env

exec $SHELL

#export KUBECONFIG=~/.kube/config
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
source ~/.bashrc