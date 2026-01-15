#!/bin/bash

# Setting
export ANDROID_BUILD_TOP=$(pwd)
export DEVICE=$1
export KSU=$2

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
echo -e "\nCONFIG_MACH_EXYNOS9810_${DEVICE^^}_KOR=y" >> "arch/arm64/configs/gorhanhee.config"

DEFCONFIG="exynos9810-${DEVICE}kor_defconfig"

if [ "${KSU}" == "y" ]; then
    CONFIGS="${DEFCONFIG} gorhanhee.config kernelsu.config"
elif [ "${KSU}" == "n" ]; then
    CONFIGS="${DEFCONFIG} gorhanhee.config"
else
    echo "Check KSU Oprion ex)./build.sh crownlte y"    
fi

make ${MAKE_ARGS} ${CONFIGS}|| exit 1
make ${MAKE_ARGS} || exit 1
