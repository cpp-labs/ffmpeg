#!/bin/sh

trap exit ERR

pushd modules
./build_android.sh
popd

ndk-build NDK_LIBS_OUT="../jniLibs.32"
ndk-build -j8 NDK_APPLICATION_MK=Application64.mk NDK_LIBS_OUT="../jniLibs.64"
