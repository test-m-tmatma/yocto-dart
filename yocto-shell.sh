#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
DOCKER_HOME=$SCRIPT_DIR/container/home/yocto
TARGET_HOME=/home/yocto

DOCKER_OPT=$SCRIPT_DIR/opt
TARGET_OPT=/opt

mkdir -p $DOCKER_HOME
mkdir -p $DOCKER_OPT

docker run -it \
    -u yocto:yocto \
    -v $DOCKER_OPT:$TARGET_OPT \
    -v $DOCKER_HOME:$TARGET_HOME \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME/.Xauthority:$TARGET_HOME/.Xauthority \
    -e DISPLAY=unix${DISPLAY} \
    -w $TARGET_HOME \
    yocto-dart-zeus:latest \
    /bin/bash
