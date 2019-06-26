#!/bin/bash
# setup awscli, parallelcluster on CentOS7

# install yum repo
yum install -y epel-release centos-release-scl

# install basic tools
yum install -y wget python-pip zstd bzip2 zip unzip jq tree net-tools rsync traceroute telnet
yum groupinstall -y "Development tools"

# install awscli and parallelcluster
pip install -U pip
pip install awscli aws-parallelcluster

# codedeploy agent
yum install -y ruby wget
cd /tmp
wget https://aws-codedeploy-us-west-2.s3.us-west-2.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo systemctl restart codedeploy-agent
