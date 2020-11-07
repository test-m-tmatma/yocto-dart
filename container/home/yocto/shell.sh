#!/bin/bash

SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

# supress EULA confirmation at setup-environment
EULA=y

cd $SCRIPT_DIR/var-fslc-yocto
MACHINE=imx6ul-var-dart DISTRO=fslc-framebuffer . setup-environment build_fb
