#!/bin/bash

export GNAME=admin
export NEWGID=3000

groupadd -g ${NEWGID} ${GNAME}
echo "%${GNAME}       ALL=(ALL)       NOPASSWD: ALL" | tee -a /etc/sudoers
