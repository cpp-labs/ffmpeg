#!/bin/sh
trap exit ERR
export TARGETOS="Android"
export ARCH="arm64"
export ARCH_ABI="arm64-v8a"
export CPU="armv8-a"
export SYSTEM="aarch64-linux-android"
export HOST="aarch64-linux-android"
#export TOOLCHAIN=$NDK/toolchains/aarch64-linux-android-$TOOLCHAIN_VERSION/prebuilt/$HOST_PLATFORM
#export SYSROOT=$NDK/platforms/$NDK_PLATFORM/arch-$ARCH
export NDK_PLATFORM=android-21
export TOOLCHAIN=$NDK_STANDALONE/$NDK_PLATFORM/$ARCH
export SYSROOT=$TOOLCHAIN/sysroot
export CFLAGS="-march=$CPU --sysroot=$SYSROOT -I$SYSROOT/usr/include -D__ANDROID_API__=21 $CFLAGS"
export LDFLAGS="-L$SYSROOT/usr/lib $LDFLAGS"
export CPPFLAGS="$CFLAGS $CPPFLAGS" 
export CXXFLAGS="$CFLAGS $CXXFLAGS" 
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

#rm -rf build/$TARGETOS/$ARCH_ABI
rm -rf build/tmp/$TARGETOS/$ARCH_ABI
./build_core.sh