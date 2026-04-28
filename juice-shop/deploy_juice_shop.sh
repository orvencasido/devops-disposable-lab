#!/bin/bash

set -e

cd /home/ubuntu

git clone https://github.com/juice-shop/juice-shop.git

cd juice-shop

docker compose -f docker-compose.test.yml up -d