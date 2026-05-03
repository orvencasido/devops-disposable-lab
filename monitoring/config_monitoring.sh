#!/bin/bash 

set -e 

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install monitoring prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  --create-namespace

#kubectl port-forward -n monitoring svc/monitoring-grafana 3000:80