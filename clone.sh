#!/bin/bash -e

BRANCHNAME=fsl-zeus
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# Top dir of source
HOST_DOCKER_HOME=$SCRIPT_DIR/container/home/yocto
YOCTO_FSLC_DIR=$HOST_DOCKER_HOME/var-fsl-yocto

# 'repo' command
REPO_DIR=$SCRIPT_DIR/bin
REPO=$REPO_DIR/repo

# get 'repo'
mkdir -p $REPO_DIR
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ${REPO}
chmod a+x ${REPO}
PATH=${REPO_DIR}:$PATH

mkdir -p $YOCTO_FSLC_DIR
cd $YOCTO_FSLC_DIR

/usr/bin/python3 $REPO init -u https://github.com/varigit/variscite-bsp-platform.git -b $BRANCHNAME
/usr/bin/python3 $REPO sync -j$(nproc --all)
