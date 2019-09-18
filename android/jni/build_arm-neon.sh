#!/bin/sh

pushd modules/FFmpeg
./build_arm-neon.sh
./copy_arm-neon_lib.sh
popd

ndk-build APP_ABI=armeabi-v7a