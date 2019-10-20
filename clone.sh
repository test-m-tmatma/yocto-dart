#!/bin/bash -e

BRANCHNAME=thud
git clone  -b $BRANCHNAME  git://git.yoctoproject.org/poky

cd poky
git clone  -b $BRANCHNAME  git://git.openembedded.org/meta-openembedded
git clone  -b $BRANCHNAME  git://git.yoctoproject.org/meta-raspberrypi
git clone  -b $BRANCHNAME  git://github.com/meta-qt5/meta-qt5.git
git clone  -b $BRANCHNAME  https://github.com/jumpnow/meta-rpi.git

