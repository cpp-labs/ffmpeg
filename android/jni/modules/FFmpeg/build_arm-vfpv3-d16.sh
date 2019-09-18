#!/bin/sh

export ARCH="arm"
export ARCH_ABI="armeabi-v7a"
export CPU="armv7-a"
export FPU="vfpv3-d16"
export SYSTEM="arm-linux-androideabi"
export TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-$TOOLCHAIN_VERSION/prebuilt/$HOST_PLATFORM
export NDK_PLATFORM=android-9
export SYSROOT=$NDK/platforms/$NDK_PLATFORM/arch-$ARCH
export EXTRA_CFLAGS="-mfpu=vfpv3-d16 -mfloat-abi=softfp"
export ExTRA_LDFLAGS="-Wl,--fix-cortex-a8"
#export OPTFLAGS="-Os -fpic"

./build_core.sh
