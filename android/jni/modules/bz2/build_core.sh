#!/bin/sh

trap exit ERR

name="bzip2-1.0.6"
tmp_dir="build/tmp/$ARCH_ABI"
this_dir="$( (cd -P $(dirname $0) && pwd) )"
target_dir="$this_dir/build/$TARGETOS/$ARCH_ABI"
mkdir -p $tmp_dir
gzip -dcv $name.tar.gz  | tar -xv -C $tmp_dir

BZ2_DIR=$tmp_dir/$name

pushd $BZ2_DIR

make install PREFIX="$target_dir" LDFLAGS="-static $LDFLAGS" CFLAGS="$CFLAGS" CPPFLAGS="$CPPFLAGS" CXXFLAGS="$CXXFLAGS" CC="$CC" AR="$AR" RANLIB="$RANLIB"

popd
