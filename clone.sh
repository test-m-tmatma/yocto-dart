#!/bin/bash -e

BRANCHNAME=thud
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# Top dir of source
DOCKER_HOME=$SCRIPT_DIR/container/home/yocto
YOCTO_FSLC_DIR=$DOCKER_HOME/var-fsl-yocto

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

repo init -u https://github.com/varigit/variscite-bsp-platform.git -b $BRANCHNAME
repo sync -j4
