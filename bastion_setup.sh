#!/bin/bash
# setup awscli, parallelcluster on CentOS7

sudo yum install -y epel-release centos-release-scl
sudo yum install -y wget python-pip zstd bzip2 zip unzip jq tree net-tools rsync traceroute telnet
sudo yum groupinstall -y "Development tools"
sudo pip install -U pip
sudo pip install awscli aws-parallelcluster
