#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
HOST_DOCKER_HOME=$SCRIPT_DIR/container/home/yocto
TARGET_HOME=/home/yocto

HOST_DOCKER_OPT=$SCRIPT_DIR/container/opt
TARGET_OPT=/opt

mkdir -p $HOST_DOCKER_HOME
mkdir -p $HOST_DOCKER_OPT
docker run -it -u yocto:yocto -v $HOST_DOCKER_OPT:$TARGET_OPT -v $HOST_DOCKER_HOME:$TARGET_HOME -w $TARGET_HOME yocto-dart-zeus:latest /bin/bash

