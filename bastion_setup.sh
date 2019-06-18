#!/bin/bash
# setup awscli, parallelcluster on CentOS7
yum install -y epel-release centos-release-scl
yum install -y wget python-pip zstd bzip2 zip unzip jq tree net-tools rsync traceroute telnet
yum groupinstall -y "Development tools"
pip install -U pip
pip install awscli aws-parallelcluster
