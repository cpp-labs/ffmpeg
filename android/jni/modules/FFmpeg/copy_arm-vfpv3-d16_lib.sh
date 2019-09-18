#!/bin/sh

mkdir -p armeabi-v7a/include
cp -R tmp/armeabi-v7a-vfpv3-d16/include/* armeabi-v7a/include
mkdir -p armeabi-v7a/lib
cp -R tmp/armeabi-v7a-vfpv3-d16/lib/* armeabi-v7a/lib
touch armeabi-v7a/lib/*
