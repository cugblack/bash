#!/usr/bin/env bash

# step 1: 安装必要的一些系统工具
yum install -y yum-utils device-mapper-persistent-data lvm2
# Step 2: 添加软件源信息
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
# Step 3: 更新并安装Docker-CE
yum makecache fast
#依赖包docker-ce-selinux
yum install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/docker-ce-selinux-17.03.2.ce-1.el7.centos.noarch.rpm
#安装
yum install docker-ce-17.03.2.ce-1.el7.centos -y 
# Step 4: 加入开机启动Docker服务
systemctl enable docker
#启动docker
systemctl start docker

