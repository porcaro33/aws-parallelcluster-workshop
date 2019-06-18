#!/bin/bash

set -ex

# import parameters
. /etc/parallelcluster/cfnconfig

# only for master
if [[ ${cfn_node_type} =~ "MasterServer" ]]; then
  # enable password authentication
  sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
  systemctl restart sshd.service
fi
