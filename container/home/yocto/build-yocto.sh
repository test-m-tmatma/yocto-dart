#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# supress EULA confirmation at setup-environment
EULA=y

cd $SCRIPT_DIR/var-fslc-yocto
MACHINE=imx6ul-var-dart DISTRO=fslc-framebuffer . setup-environment build_fb

#bitbake meta-toolchain
#./tmp/deploy/sdk/fslc-framebuffer-glibc-x86_64-meta-toolchain-armv7at2hf-neon-toolchain-2.6.2.sh -y

bitbake core-image-minimal
