#!/bin/bash

set -ex

# import parameters
. /etc/parallelcluster/cfnconfig
CLSTNM="cpu"
INSTID=$(curl http://169.254.169.254/latest/meta-data/instance-id)

if [[ ${cfn_node_type} =~ "MasterServer" ]]; then
  aws --region ${cfn_region} ec2 create-tags --resources ${INSTID} --tags Key=Name,Value="Master: ${CLSTNM}"
else
  aws --region ${cfn_region} ec2 create-tags --resources ${INSTID} --tags Key=Name,Value="Compute: ${CLSTNM}"
fi
