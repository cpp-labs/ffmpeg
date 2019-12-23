#!/bin/sh

trap exit ERR

LIBS="FFmpeg"
for LIB in $LIBS; do 
    pushd $LIB 
    ./build_android.sh
    popd
done
