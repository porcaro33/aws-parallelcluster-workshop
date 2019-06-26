#!/bin/bash

#login to bastion node

# create sshkey
ssh-keygen -f ~/.ssh/id_rsa -q -N ""
cat ~/.ssh/id_rsa.pub

# git clone and change ssh config
cd
git clone https://github.com/porcaro33/aws-parallelcluster-workshop.git
cd aws-parallelcluster-workshop/
vi config

# copy config and chnage permission
cp ~/aws-parallelcluster-workshop/config ~/.ssh/config
chmod 600 ~/.ssh/config

# check ssh to codecommit
ssh git-codecommit.us-west-2.amazonaws.com

# git clone
git clone ssh://git-codecommit.us-west-2.amazonaws.com/v1/repos/pcluster-git

# copy pcluster files
cp -r ~/aws-parallelcluster-workshop/configs ~/pcluster-git
cp -r ~/aws-parallelcluster-workshop/projects ~/pcluster-git
cd ~/pcluster-git
git add .
git commit -m "initial commit"
git push origin master


# pcluster
cd ~/.parallelcluster
pcluster list -r us-west-2
pcluster create <cluster-name> -c <configfile-name>
pcluster delete <cluster-name>
pcluster update <cluster-name> -c <configfile-name>



https://docs.aws.amazon.com/ja_jp/codepipeline/latest/userguide/tutorials-s3deploy.html#tutorials-s3deploy-acc
