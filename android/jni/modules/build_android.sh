#!/bin/sh

trap exit ERR

LIBS="openssl bz2 FFmpeg"
for LIB in $LIBS; do 
    pushd $LIB 
    ./build_android.sh
    popd
done
