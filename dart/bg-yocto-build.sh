#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
nohup $SCRIPT_DIR/yocto-build.sh &
