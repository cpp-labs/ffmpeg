#!/bin/sh

pushd modules/FFmpeg
./build_arm-vfpv3-d16.sh
./copy_arm-vfpv3-d16_lib.sh
popd

ndk-build APP_ABI=armeabi-v7a