#!/bin/bash

set -e

cd /home/ubuntu

git clone https://github.com/orvencasido/juice-shop.git

cd juice-shop

sudo docker compose -f docker-compose.test.yml up -d