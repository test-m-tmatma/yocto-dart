#!/bin/sh -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)
DOCKER_HOME=$SCRIPT_DIR/container/home/yocto
TARGET_HOME=/home/yocto

DOCKER_OPT=$SCRIPT_DIR/container/opt
TARGET_OPT=/opt

mkdir -p $DOCKER_HOME
mkdir -p $DOCKER_OPT

docker-compose build
docker-compose run --rm -w $TARGET_HOME -u yocto yocto $TARGET_HOME/build-yocto.sh


