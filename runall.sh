#!/bin/bash

sudo apt update -y

# docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker ubuntu

# aws
sudo apt install awscli -y
mkdir ~/.aws
touch ~/.aws/credentials
cp aws/config ~/.aws/

# download kits
WRC_USERNAME='xxx' WRC_PASSWORD='xxx' kit='IRIS-2020.1.0.215.0-lnxubuntux64.tar.gz' icmkit='icm-2020.1.0.215.0-docker.tar.gz' ./getkits.sh
mv *.gz ~/
sudo docker load -i ~/icm-2020.1.0.215.0-docker.tar.gz

# download key
# s3? need a s3 role.

# for icm-utils
sudo apt install jq -y
cd ~
git clone https://github.com/IRISMeister/icm-util.git
cd icm-util
cp ~/iris.key ./irislicense
mv ~/IRIS-2020.1.0.215.0-lnxubuntux64.tar.gz ./kits
