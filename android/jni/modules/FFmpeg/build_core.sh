#!/bin/sh

trap exit ERR

name="ffmpeg-4.1.4"

tmp_dir="build/tmp/$TARGETOS/$ARCH_ABI"
if [ ! $FPU = "" ]; then
    tmp_dir="$tmp_dir-$FPU"
fi
mkdir -p $tmp_dir
this_dir="$( (cd -P $(dirname $0) && pwd) )"
target_dir="$this_dir/build/$TARGETOS/$ARCH_ABI"
if [ ! $FPU = "" ]; then
    target_dir="$target_dir-$FPU"
fi
bzip2 -dcv $name.tar.bz2  | tar -xv -C $tmp_dir
patch -d $tmp_dir -p0 < $name.diff

FFMPEG_DIR=$tmp_dir/$name
SCRIPT_DIR=$( (cd -P $(dirname $0) && pwd) )

cd $FFMPEG_DIR

OPENSSL_DIR="$this_dir/../openssl/build/$TARGETOS/$ARCH_ABI"
AOM_DIR="$this_dir/../aom/build/$TARGETOS/$ARCH_ABI"
BZ_DIR="$this_dir/../bz2/build/$TARGETOS/$ARCH_ABI"

CFLAGS="$CFLAGS -I$BZ_DIR/include"
LDFLAGS="$LDFLAGS -L$BZ_DIR/lib"
CFLAGS="$CFLAGS -I$OPENSSL_DIR/include"
LDFLAGS="$LDFLAGS -L$OPENSSL_DIR/lib"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$OPENSSL_DIR/lib/pkgconfig"

# Default configure options
CONFIGURE_OPTIONS="$CONFIGURE_OPTIONS --enable-pic --enable-static --disable-shared --disable-debug  --disable-programs --disable-doc --enable-network --disable-encoders --enable-encoder=aac --enable-encoder=mjpeg --disable-muxers --enable-muxer=mp4 --enable-muxer=mpegts --enable-muxer=spdif --enable-bsfs --disable-devices --disable-filters --enable-zlib --enable-bzlib" 
CONFIGURE_OPTIONS="$CONFIGURE_OPTIONS --enable-openssl"
CONFIGURE_OPTIONS="$CONFIGURE_OPTIONS --enable-zlib"
CONFIGURE_OPTIONS="$CONFIGURE_OPTIONS --enable-bzlib"
CONFIGURE_OPTIONS="$CONFIGURE_OPTIONS --disable-libaom"
CONFIGURE_OPTIONS="$CONFIGURE_OPTIONS --cross-prefix=$TOOLCHAIN/bin/$SYSTEM-"
CONFIGURE_OPTIONS="$CONFIGURE_OPTIONS --target-os=linux --cpu=$CPU --sysroot=$SYSROOT"
#CONFIGURE_OPTIONS="$CONFIGURE_OPTIONS --disable-decoder=eac3 --disable-decoder=truehd --disable-decoder=mlp"

echo "Configure options: $CONFIGURE_OPTIONS"
./configure --prefix="$target_dir" --enable-cross-compile --target-os=darwin --arch=$ARCH --extra-cflags="$CFLAGS" --extra-ldflags="$LDFLAGS" --optflags="$OPTFLAGS" $CONFIGURE_OPTIONS 
sed -ie "s/-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE//g" "ffbuild/config.mak"

make -j8 install
