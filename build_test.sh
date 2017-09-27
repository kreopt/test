#!/usr/bin/env bash

if [[ ! ${CI_CACHE_DIR+x} ]]; then
CI_CACHE_DIR="/home/ubuntu/aptcache"
fi;

sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y && \
sudo apt-get -o dir::cache::archives=${CI_CACHE_DIR} update -y && \
sudo apt-get -o dir::cache::archives=${CI_CACHE_DIR} install cmake gcc-6 g++-6 -y && \
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 60 --slave /usr/bin/g++ g++ /usr/bin/g++-6 && \
sudo update-alternatives --config gcc

rm -r test_build
mkdir test_build
cd test_build
cmake ../ -DBUILD_TEST=ON
./testTest