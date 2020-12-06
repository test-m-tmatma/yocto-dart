#!/bin/bash -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# supress EULA confirmation at setup-environment
EULA=y

cd $SCRIPT_DIR/var-fsl-yocto
MACHINE=imx6ul-var-dart DISTRO=fsl-imx-fb . var-setup-release.sh -b build_fb
#MACHINE=imx6ul-var-dart DISTRO=fsl-framebuffer . var-setup-release.sh build_fb

bitbake-layers add-layer $SCRIPT_DIR/var-fsl-yocto/sources/meta-test-image

#bitbake meta-toolchain
#./tmp/deploy/sdk/fsl-imx-fb-glibc-x86_64-meta-toolchain-cortexa7t2hf-neon-toolchain-5.4-zeus.sh -y
bitbake custom-test-image -c populate_sdk

if [ -e tmp/deploy/sdk/fsl-imx-fb-glibc-x86_64-custom-test-image-cortexa7t2hf-neon-toolchain-5.4-zeus.sh ]; then
    ./tmp/deploy/sdk/fsl-imx-fb-glibc-x86_64-custom-test-image-cortexa7t2hf-neon-toolchain-5.4-zeus.sh
fi

bitbake custom-test-image
