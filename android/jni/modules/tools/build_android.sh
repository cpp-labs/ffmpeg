#!/bin/sh

trap exit ERR

export TARGETOS="Android"
SCRIPT_PATH=$(dirname $0)
$SCRIPT_PATH/build_android_arm64.sh
$SCRIPT_PATH/build_android_arm.sh
$SCRIPT_PATH/build_android_x86_64.sh
$SCRIPT_PATH/build_android_x86.sh



