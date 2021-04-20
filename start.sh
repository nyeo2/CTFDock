#!/bin/bash
if [ $# -lt 2 ]; then
  echo 1>&2 "Usage: $0 <glibc version> <path to ctf files>"
  exit 2
fi
git clone https://sourceware.org/git/glibc.git
cd glibc
git checkout release/$1/master
mkdir build
cd build
../configure --prefix=/usr
#make
cd ../../

rm -rf resources
mkdir resources
mkdir resources/files
cp -r glibc/build ./resources/build 
cp $2 ./resources/files/

docker build -t ctf .
docker run -it ctf:latest /bin/bash
