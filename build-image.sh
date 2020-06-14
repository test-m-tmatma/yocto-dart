#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)

sudo docker build -t yocto-dart:latest $SCRIPT_DIR/docker-conf

