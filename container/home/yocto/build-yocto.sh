#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# supress EULA confirmation at setup-environment
EULA=y

cd $SCRIPT_DIR/var-fsl-yocto
MACHINE=imx6ul-var-dart DISTRO=fsl-framebuffer . var-setup-release.sh build_fb

#bitbake meta-toolchain
#./tmp/deploy/sdk/fsl-framebuffer-glibc-x86_64-meta-toolchain-armv7at2hf-neon-toolchain-2.6.2.sh -y

bitbake core-image-minimal
