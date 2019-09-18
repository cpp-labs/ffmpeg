#!/bin/sh

export ARCH="x86"
export ARCH_ABI="x86"
export CPU="i686"
export FPU="sse3"
export SYSTEM="i686-linux-android"
export TOOLCHAIN=$NDK/toolchains/x86-$TOOLCHAIN_VERSION/prebuilt/$HOST_PLATFORM
export NDK_PLATFORM=android-9
export SYSROOT=$NDK/platforms/$NDK_PLATFORM/arch-$ARCH
export EXTRA_CFLAGS="-mtune=atom -msse3 -mssse3 -mfpmath=sse"
#export EXTRA_CFLAGS="$EXTRA_CFLAGS -fpredictive-commoning -fipa-cp-clone -funswitch-loops -fgcse-after-reload -ftree-vectorize -ffunction-sections"
export EXTRA_LDFLAGS=""
#export OPTFLAGS="-O2"
	
./build_core.sh
