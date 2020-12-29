#!/bin/sh -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)
HOST_DOCKER_HOME=$SCRIPT_DIR/container/home/yocto
HOST_DL_DIR=$SCRIPT_DIR/container/home/yocto/downloads
TARGET_HOME=/home/yocto
REMOTE_URL=$(git remote get-url origin)
BRANCH_NAME=$(git name-rev --name-only HEAD | sed "s/\W/_/g")
CONTAINER_NAME=$(basename $REMOTE_URL)--${BRANCH_NAME}--$(basename $SCRIPT_DIR)__$(git rev-parse --short HEAD)__$(date "+%Y%m%d-%H%M%S")

HOST_DOCKER_OPT=$SCRIPT_DIR/container/opt
TARGET_OPT=/opt

mkdir -p $HOST_DOCKER_HOME
mkdir -p $HOST_DOCKER_OPT
mkdir -p $HOST_DL_DIR

docker run --rm -u yocto:yocto \
        --name $CONTAINER_NAME \
	-v $HOST_DOCKER_OPT:$TARGET_OPT \
	-v $HOST_DL_DIR:$TARGET_HOME/downloads \
	-v $HOST_DOCKER_HOME:$TARGET_HOME \
	-w $TARGET_HOME yocto-dart-zeus $TARGET_HOME/build-yocto.sh


