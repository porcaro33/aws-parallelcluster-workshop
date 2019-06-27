#!/bin/bash

# import parameters
CLSTINI_DIR="/shared/cluster-init"
S3BUCKET="<your bucket name>"
CLSTNM="cpu"

if [ ! -e "${CLSTINI_DIR}" ]; then
  mkdir -p ${CLSTINI_DIR}
fi

if [ ! -e "${CLSTINI_DIR}/run" ]; then
  mkdir -p ${CLSTINI_DIR}/run
fi

aws s3 sync s3://${S3BUCKET}/projects/${CLSTNM}/scripts/ ${CLSTINI_DIR}/run
aws s3 sync s3://${S3BUCKET}/projects/${CLSTNM}/files/ ${CLSTINI_DIR}/run
chmod +rx ${CLSTINI_DIR}/run/*
ls -l ${CLSTINI_DIR}/run

${CLSTINI_DIR}/run/01-disable-ht.sh
${CLSTINI_DIR}/run/01-enable-passauth.sh
${CLSTINI_DIR}/run/01-install-basic-tools.sh
${CLSTINI_DIR}/run/01-reassign-nametag.sh
${CLSTINI_DIR}/run/02-creategroup-admin.sh
${CLSTINI_DIR}/run/02-createuser-pcluster.sh
${CLSTINI_DIR}/run/03-install-ompi4.sh
${CLSTINI_DIR}/run/08-install-cloudwatch-agent.sh
