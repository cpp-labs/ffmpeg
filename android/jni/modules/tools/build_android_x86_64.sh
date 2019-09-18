#!/bin/sh
trap exit ERR
export TARGETOS="Android"
export ARCH="x86_64"
export ARCH_ABI="x86_64"
export CPU="x86-64"
export SYSTEM="x86_64-linux-android"
export HOST="x86_64-linux-android"
#export TOOLCHAIN=$NDK/toolchains/x86_64-$TOOLCHAIN_VERSION/prebuilt/$HOST_PLATFORM
#export SYSROOT=$NDK/platforms/$NDK_PLATFORM/arch-$ARCH
export NDK_PLATFORM=android-21
export TOOLCHAIN=$NDK_STANDALONE/$NDK_PLATFORM/$ARCH
export SYSROOT=$TOOLCHAIN/sysroot
export CFLAGS="-march=$CPU --sysroot=$SYSROOT -D__ANDROID_API__=21 $CFLAGS"
export LDFLAGS="-L$SYSROOT/usr/lib64 $LDFLAGS"
export CC="$TOOLCHAIN/bin/$SYSTEM-clang"
export CPP="$TOOLCHAIN/bin/$SYSTEM-cpp"
export CXX="$TOOLCHAIN/bin/$SYSTEM-clang++"
export LD="$TOOLCHAIN/bin/$SYSTEM-ld"
export AR="$TOOLCHAIN/bin/$SYSTEM-ar"
export AS="$TOOLCHAIN/bin/$SYSTEM-as"
export LD="$TOOLCHAIN/bin/$SYSTEM-ld"
export RANLIB="$TOOLCHAIN/bin/$SYSTEM-ranlib"
export NM="$TOOLCHAIN/bin/$SYSTEM-nm"
export STRIP="$TOOLCHAIN/bin/$SYSTEM-strip"
export PATH=$PATH:/usr/local/ndk-standalone/$NDK_PLATFORM/$ARCH/bin

rm -rf build/tmp/$ARCH_ABI
./build_core.sh