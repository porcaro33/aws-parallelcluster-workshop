#!/bin/bash

yum install -y wget epel-release centos-release-scl python-pip
yum install -y rh-python36 zstd bzip2 zip unzip jq tree net-tools rsync traceroute telnet
yum groupinstall -y "Development tools"
