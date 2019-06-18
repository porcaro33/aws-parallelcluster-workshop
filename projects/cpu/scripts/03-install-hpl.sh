#!/bin/bash

set -ex

# import parameters
. /etc/parallelcluster/cfnconfig
CLSTINI_DIR="/shared/cluster-init"


#install openmpi
if [[ ${cfn_node_type} =~ "MasterServer" ]]; then
  if [ ! -e "/shared/opt" ]; then
    mkdir -p /shared/opt
  fi

  if [ ! -e "${CLSTINI_DIR}/ompi4_install" ]; then
    mkdir -p ${CLSTINI_DIR}/ompi4_install
  fi

  if [ ! -f "${CLSTINI_DIR}/openmpi-4.0.1.tar.gz" ]; then
    wget https://download.open-mpi.org/release/open-mpi/v4.0/openmpi-4.0.1.tar.gz -P ${CLSTINI_DIR}/ompi4_install
  fi

  if [ ! -e "${CLSTINI_DIR}/ompi4_install/openmpi-4.0.1" ]; then
    tar -C ${CLSTINI_DIR}/ompi4_install -zvxf ${CLSTINI_DIR}/openmpi-4.0.1.tar.gz
  fi

  pushd ${CLSTINI_DIR}/ompi4_install/openmpi-4.0.1
  ./configure --prefix=/shared/opt/openmpi-4.0.1
  make
  make install
  popd

  ln -s /shared/opt/openmpi-4.0.1 /shared/opt/openmpi
  export PATH=/shared/opt/openmpi/bin:$PATH
  export LD_LIBRARY_PATH=/shared/opt/openmpi/lib:$LD_LIBRARY_PATH

  yum install -y atlas atlas-devel blas blas-devel lapack lapack-devel
  wget http://www.netlib.org/benchmark/hpl/hpl-2.0.tar.gz
  # wget http://www.netlib.org/benchmark/hpl/hpl-2.0.tar.gz
# tar xfvz hpl-2.0.tar.gz
# mv hpl-2.0 hpl
# cd hpl
# cp setup/Make.Linux_PII_CBLAS .
http://www.thinkredbarn.com/WW35_walkthrough.pdf

fi
