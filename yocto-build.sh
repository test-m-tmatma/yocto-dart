#!/bin/sh -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)
DOCKER_HOME=$SCRIPT_DIR/container/home/yocto
DOWNLOADS=${1:-$SCRIPT_DIR/container/home/yocto/downloads}
TARGET_HOME=/home/yocto
REMOTE_URL=$(git remote get-url origin)
BRANCH_NAME=$(git name-rev --name-only HEAD | sed "s/\W/_/g")
CONTAINER_NAME=$(basename $REMOTE_URL)--${BRANCH_NAME}--$(basename $SCRIPT_DIR)__$(git rev-parse --short HEAD)__$(date "+%Y%m%d-%H%M%S")

DOCKER_OPT=$SCRIPT_DIR/container/opt
TARGET_OPT=/opt

mkdir -p $DOCKER_HOME
mkdir -p $DOCKER_OPT
mkdir -p $DOWNLOADS
docker run --rm -u yocto:yocto \
        --name $CONTAINER_NAME \
	-v $DOCKER_OPT:$TARGET_OPT \
	-v $DOWNLOADS:$TARGET_HOME/downloads \
	-v $DOCKER_HOME:$TARGET_HOME \
	-w $TARGET_HOME yocto-dart-zeus $TARGET_HOME/build-yocto.sh


