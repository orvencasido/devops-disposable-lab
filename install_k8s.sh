#!/bin/bash

set -e

curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644
