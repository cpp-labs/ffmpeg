#!/bin/sh

trap exit ERR

name="openssl-1.0.2r"
tmp_dir="build/tmp/$TARGETOS/$ARCH_ABI"
target_dir="$( (cd -P $(dirname $0) && pwd) )/$tmp_dir"
mkdir -p $tmp_dir
gzip -dcv $name.tar.gz  | tar -xv -C $tmp_dir

OPENSSL_DIR=$tmp_dir/$name

pushd $OPENSSL_DIR

case $ARCH in
    arm64)
        export OPENSSL_COMPILER="linux-generic64"
        ;;
    arm)
        export OPENSSL_COMPILER="linux-generic32"
        ;;
    x86_64)
        export OPENSSL_COMPILER="linux-generic64"
        ;;
    x86)
        export OPENSSL_COMPILER="linux-generic32"
        ;;
esac

./Configure $OPENSSL_COMPILER --prefix="$target_dir" $CONFIGURE_OPTIONS

make -j8
make install_sw

popd

mkdir -p build/$TARGETOS/$ARCH_ABI/include
cp -R $tmp_dir/include/* build/$TARGETOS/$ARCH_ABI/include/
mkdir -p build/$TARGETOS/$ARCH_ABI/lib
cp -R $tmp_dir/lib/* build/$TARGETOS/$ARCH_ABI/lib
