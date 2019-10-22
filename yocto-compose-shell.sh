#!/bin/sh -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)
DOCKER_HOME=$SCRIPT_DIR/container/yocto
TARGET_HOME=/home/yocto

DOCKER_OPT=$SCRIPT_DIR/container/opt
TARGET_OPT=/opt

mkdir -p $DOCKER_HOME
mkdir -p $DOCKER_OPT
sudo docker-compose build
sudo docker-compose run  -w $TARGET_HOME -u yocto yocto /bin/bash


