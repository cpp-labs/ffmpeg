#!/bin/sh

mkdir -p armeabi-v7a/include
cp -R tmp/armeabi-v7a-neon/include/* armeabi-v7a/include
mkdir -p armeabi-v7a/lib
cp -R tmp/armeabi-v7a-neon/lib/* armeabi-v7a/lib
touch armeabi-v7a/lib/*
