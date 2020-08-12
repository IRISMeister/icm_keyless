#!/bin/bash

sudo apt update -y

# docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker ubuntu

# aws
# awscli is not required but install it because it is usefull anyway.
sudo apt install awscli -y
mkdir ~/.aws
touch ~/.aws/credentials
cp aws/config ~/.aws/

# download kits
WRC_USERNAME='xxx' WRC_PASSWORD='xxx' kit='IRIS-2020.1.0.215.0-lnxubuntux64.tar.gz' icmkit='icm-2020.1.0.215.0-docker.tar.gz' ./getkits.sh
mv *.gz ~/
sudo docker load -i ~/icm-2020.1.0.215.0-docker.tar.gz

# for icm-utils
sudo apt install jq -y
cd ~
git clone https://github.com/IRISMeister/icm-util.git
cd icm-util
mv ~/IRIS-2020.1.0.215.0-lnxubuntux64.tar.gz ./kits

# download iris.key from somewrhere...s3? 
#
if [ -e ~/iris.key ]; then
  cp ~/iris.key ./irislicense
else
  echo "License key (iris.key) doesn't exist!"
fi
