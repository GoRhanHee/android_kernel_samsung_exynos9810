#!/bin/bash

# Setting
export ANDROID_BUILD_TOP=$(pwd)
export DEVICE=$1

# OEM Setting
export ARCH=arm64
export ANDROID_MAJOR_VERSION=q

# Cooking Kernel Source
mkdir out

MAKE_ARGS="
-j16 \
ARCH=arm64 \
O=out
"

DEFCONFIG="exynos9810-${DEVICE}kor_defconfig"

echo -e "\nCONFIG_MACH_EXYNOS9810_${DEVICE^^}_KOR=y" >> "arch/arm64/configs/gorhanhee.config"

make ${MAKE_ARGS} ${DEFCONFIG} gorhanhee.config|| exit 1
make ${MAKE_ARGS} || exit 1
