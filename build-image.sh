#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)

docker build -t yocto-dart-zeus:latest $SCRIPT_DIR/docker-conf

