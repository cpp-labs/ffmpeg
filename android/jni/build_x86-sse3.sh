#!/bin/sh

pushd modules/FFmpeg
./build_x86-sse3.sh
./copy_x86-sse3_lib.sh
popd

ndk-build APP_ABI=x86