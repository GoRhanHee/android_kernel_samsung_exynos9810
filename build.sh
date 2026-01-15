#!/bin/bash

# Import submodule
git submodule init && git submodule update --remote

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

# Cooking boot.img
chmod +x ${ANDROID_BUILD_TOP}/prebuilts/*

unzip -jo ${ANDROID_BUILD_TOP}/prebuilts/${DEVICE}/boot.zip boot.img -d ${ANDROID_BUILD_TOP}/prebuilts/
cd ${ANDROID_BUILD_TOP}/prebuilts
./magiskboot unpack boot.img
cp ${ANDROID_BUILD_TOP}/out/arch/arm64/boot/Image ${ANDROID_BUILD_TOP}/prebuilts/kernel
cp ${ANDROID_BUILD_TOP}/out/arch/arm64/boot/dtb.img ${ANDROID_BUILD_TOP}/prebuilts/extra
./magiskboot repack boot.img
cp ${ANDROID_BUILD_TOP}/prebuilts/new-boot.img ${ANDROID_BUILD_TOP}/prebuilts/zip/boot.img

# Cooking Flashable *.zip file
cd ${ANDROID_BUILD_TOP}/prebuilts/zip
zip -r "${DEVICE}_Kernel_File.zip" ./* -x "${DEVICE}_Kernel_File.zip"
echo "Finish!"
