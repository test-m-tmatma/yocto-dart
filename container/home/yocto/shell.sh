#!/bin/bash

SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

# supress EULA confirmation at setup-environment
EULA=y

cd $SCRIPT_DIR/var-fsl-yocto
#MACHINE=imx6ul-var-dart DISTRO=fsl-framebuffer . setup-environment build_fb
MACHINE=imx6ul-var-dart DISTRO=fsl-imx-fb . setup-environment build_fb
