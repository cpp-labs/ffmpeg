#!/bin/sh
trap exit ERR
export TARGETOS="Android"
export ARCH="x86"
export ARCH_ABI="x86"
export CPU="i686"
export SYSTEM="i686-linux-android"
export HOST="i686-linux-android"
#export TOOLCHAIN=$NDK/toolchains/x86-$TOOLCHAIN_VERSION/prebuilt/$HOST_PLATFORM
#export SYSROOT=$NDK/platforms/$NDK_PLATFORM/arch-$ARCH
export NDK_PLATFORM=android-14
export TOOLCHAIN=$NDK_STANDALONE/$NDK_PLATFORM/$ARCH
export SYSROOT=$TOOLCHAIN/sysroot
export CFLAGS="-march=$CPU --sysroot=$SYSROOT -D__ANDROID_API__=14 $CFLAGS"
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