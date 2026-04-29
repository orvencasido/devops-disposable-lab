#!/bin/bash 

set -e

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip

sudo ./aws/install

aws --version

#aws configure
#get aws access key id via aws console
#get aws secret access key via aws console
#set default region
