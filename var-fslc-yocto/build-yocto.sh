#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

cd $SCRIPT_DIR
MACHINE=imx6ul-var-dart DISTRO=fslc-framebuffer . setup-environment build_fb

#bitbake console-image
bitbake core-image-minimal


