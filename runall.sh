#!/bin/bash

#ubuntu
if [ -e /etc/lsb-release ]; then
  sudo apt update -y
  # docker
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh
  sudo usermod -aG docker ubuntu
  # awscli is not required but install it because it is usefull anyway.
  sudo apt install awscli -y
  sudo apt install jq -y
# Amazon Linux?
elif [ -e /etc/system-release ]; then
  sudo yum -y update
  sudo yum install -y docker
  sudo systemctl start docker
  sudo usermod -a -G docker ec2-user
  sudo yum install jq -y
else
  echo "uknown O/S. Quiting."
  exit 1
fi

# awscli
mkdir ~/.aws
cp ./icm_keyless/aws/config ~/.aws/
# this empty file is required by ICM.
touch ~/.aws/credentials

# download kits
#WRC_USERNAME='xxx' WRC_PASSWORD='xxx' kit='IRIS-2020.1.0.215.0-lnxubuntux64.tar.gz' icmkit='icm-2020.1.0.215.0-docker.tar.gz' ./icm_keyless/getkits.sh
./icm_keyless/getkits.sh
sudo docker load -i ./icm-2020.1.0.215.0-docker.tar.gz

# for icm-utils
git clone https://github.com/IRISMeister/icm-util.git
mv ./IRIS-2020.1.0.215.0-lnxubuntux64.tar.gz ./icm-util/kits

# download iris.key from somewrhere...s3? 
#
if [ -e ~/iris.key ]; then
  cp ~/iris.key ./icm-util/irislicense
else
  echo "License key (iris.key) doesn't exist!"
fi
