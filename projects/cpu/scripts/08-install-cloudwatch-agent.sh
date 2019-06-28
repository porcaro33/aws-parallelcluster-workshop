#!/bin/bash

set -ex

# import parameters
. /etc/parallelcluster/cfnconfig
CLSTINI_DIR="/shared/cluster-init"
S3BUCKET="<your bucket name>"
CLSTNM="cpu"

# Runs only on scheduler
if [[ ${cfn_node_type} =~ "MasterServer" ]]; then

  #install SSM agent
  yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
  systemctl enable amazon-ssm-agent

  # install cloudwatch agent
  if [ ! -e "${CLSTINI_DIR}/cloudwatch_install" ]; then
    mkdir -p ${CLSTINI_DIR}/cloudwatch_install
  fi

  pushd ${CLSTINI_DIR}/cloudwatch_install
  wget https://s3.amazonaws.com/amazoncloudwatch-agent/linux/amd64/latest/AmazonCloudWatchAgent.zip
  unzip -o AmazonCloudWatchAgent.zip
  ./install.sh
  popd ${CLSTINI_DIR}/cloudwatch_install

  # deploy cloudwatch config
  aws s3 cp s3://${S3BUCKET}/projects/${CLSTNM}/files/config.json /opt/aws/amazon-cloudwatch-agent/bin/config.json
  /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json -s

  # enable cloudwatch agent
  systemctl enable amazon-cloudwatch-agent.service
fi
