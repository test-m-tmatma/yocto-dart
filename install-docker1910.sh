#!/bin/sh -e

sudo true
sudo apt-get update  -y
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   disco \
   stable"

sudo apt-get update -y

sudo apt-get install  -y docker-ce docker-ce-cli containerd.io
sudo systemctl start  docker
sudo systemctl enable docker

sudo apt install -y docker-compose
