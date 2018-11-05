#!/usr/bin/env bash

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update && sudo apt-get install -y docker-ce=17.03.3~ce-0~ubuntu-xenial

sudo service docker restart

sudo mkdir -pv /data

sudo wget https://netmarket.oss.aliyuncs.com/kube1.11.0.tar.gz -o /data/

sudo tar zxvf /date/kube1.11.0.tar.gz