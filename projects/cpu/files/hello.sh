#!/bin/bash
## SGE Arguments
#$ -cwd
#$ -S /bin/bash
#$ -N hello-test

echo "starting a job" | tee out.txt
date | tee -a out.txt
cat /etc/redhat-release | tee -a out.txt
uname -a  | tee -a out.txt
echo "Hello ParallelCluster!!!" | tee -a out.txt
sleep 60
echo "finihsed a job" | tee -a out.txt
date | tee -a out.txt
