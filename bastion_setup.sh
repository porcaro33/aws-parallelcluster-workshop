#!/bin/bash
# setup awscli, parallelcluster on CentOS7

sudo yum install -y wget epel-release centos-release-scl python-pip zstd bzip2 zip unzip jq tree net-tools rsync traceroute telnet
sudo yum groupinstall -y "Development tools"
sudo pip install awscli
sudo pip install aws-parallelcluster
