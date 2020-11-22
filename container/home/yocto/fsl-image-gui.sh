#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
ADDCONF=${SCRIPT_DIR}/addconf.conf
LOGDIR=${SCRIPT_DIR}/log/$(date +%Y%m%d-%H%M%S)

# supress EULA confirmation at setup-environment
EULA=y

cd $SCRIPT_DIR/var-fsl-yocto
MACHINE=imx6ul-var-dart DISTRO=fsl-imx-fb . var-setup-release.sh -b build_fb
#MACHINE=imx6ul-var-dart DISTRO=fsl-framebuffer . var-setup-release.sh build_fb

cat ${ADDCONF} >> conf/local.conf

#bitbake meta-toolchain
#./tmp/deploy/sdk/fsl-framebuffer-glibc-x86_64-meta-toolchain-armv7at2hf-neon-toolchain-2.6.2.sh -y
#./tmp/deploy/sdk/fsl-imx-fb-glibc-x86_64-meta-toolchain-cortexa7t2hf-neon-toolchain-5.4-zeus.sh -y

mkdir -p ${LOGDIR}

#bitbake core-image-minimal
bitbake -e fsl-image-gui > ${LOGDIR}/dep.txt
bitbake -DDD -f fsl-image-gui -c rootfs > ${LOGDIR}/bitbakelog.txt
find tmp/work/imx6ul_var_dart-poky-linux-gnueabi/fsl-image-gui/1.0-r0/rootfs > ${LOGDIR}/rootfs.txt

