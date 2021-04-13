#!/bin/bash
if [ $# -lt 2 ]; then
  echo 1>&2 "Usage: $0 <glibc version> <path to binary>"
  exit 2
fi
#git clone https://sourceware.org/git/glibc.git
cd glibc
git checkout release/$1/master
mkdir build
cd build
../configure --prefix=/usr
make
cd ../../
cp -r glibc/build ./res 
cp $2 ./res