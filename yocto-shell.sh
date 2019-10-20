#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
DOCKER_HOME=$SCRIPT_DIR/docker-home

TARGET_HOME=/home/yocto
sudo docker run -it -u yocto:yocto -v $DOCKER_HOME:$TARGET_HOME -w $TARGET_HOME yocto-dart:latest /bin/bash

