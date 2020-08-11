#!/bin/bash

sudo apt update -y

# docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker ubuntu

# aws
mkdir ~/.aws
touch ~/.aws/credentials
cp aws/config ~/.aws/

./getkits.sh
sudo docker load -i icm-2020.1.0.215.0-docker.tar.gz

# for icm-utils
sudo apt install jq -y
git clone https://github.com/IRISMeister/icm-util.git
cp ./iris.key　./icm-util/irislicense
mv ./IRIS-2020.1.0.215.0-lnxubuntux64.tar.gz ./icm-util/kits

