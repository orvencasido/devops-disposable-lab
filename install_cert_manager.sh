#!/bin/bash

set -e 

kubectl apply -f https://github.com/cert-manager/cert-manager/releases/latest/download/cert-manager.yaml

#to view cert status
#kubectl get clusterissuer

#to check logs
#kubectl describe clusterissuer letsencrypt-prod