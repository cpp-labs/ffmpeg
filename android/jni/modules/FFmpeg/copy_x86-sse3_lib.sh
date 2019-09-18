#!/bin/sh

mkdir -p x86/include
cp -R tmp/x86-sse3/include/* x86/include
mkdir -p x86/lib
cp -R tmp/x86-sse3/lib/* x86/lib
touch x86/lib/*
