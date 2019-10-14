#!/bin/sh

TARGET_HOME=/home/yocto
sudo docker run -it -u yocto:yocto -v $(pwd):$TARGET_HOME -w $TARGET_HOME yocto-dart:latest /bin/bash

