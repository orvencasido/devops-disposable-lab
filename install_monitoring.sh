#!/bin/bash

set -e

helm upgrade monitoring prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  -f monitoring-values.yaml

#helm install monitoring prometheus-community/kube-prometheus-stack \
#  --namespace monitoring \
#  -f monitoring-values.yaml
