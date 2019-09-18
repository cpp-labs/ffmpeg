#!/bin/sh

trap exit ERR

ORG_CFLAGS="$CFLAGS"
ORG_LDFLAGS="$LDFLAGS"

export CFLAGS="$ORG_CFLAGS"
export LDFLAGS="$ORG_LDFLAGS"
export FPU=""
export CONFIGURE_OPTIONS=""
../tools/build_android_arm64.sh

export CFLAGS="$ORG_CFLAGS"
export LDFLAGS="-Wl,--fix-cortex-a8 $ORG_LDFLAGS"
export FPU=""
export CONFIGURE_OPTIONS=""
../tools/build_android_arm.sh

export CFLAGS="-mfpu=vfpv3-d16 -mfloat-abi=softfp $ORG_CFLAGS"
export LDFLAGS="-Wl,--fix-cortex-a8 $ORG_LDFLAGS"
export FPU="vfpv3-d16"
export CONFIGURE_OPTIONS=""
../tools/build_android_arm.sh

export CFLAGS="-mtune=atom $ORG_CFLAGS"
export LDFLAGS="$ORG_LDFLAGS"
export FPU=""
export CONFIGURE_OPTIONS="--disable-asm"
../tools/build_android_x86_64.sh

export CFLAGS="-mtune=atom $ORG_CFLAGS"
export LDFLAGS="$ORG_LDFLAGS"
export FPU=""
export CONFIGURE_OPTIONS="--disable-mmx --disable-mmxext"
../tools/build_android_x86.sh


