#!/usr/bin/env bash

if [[ ! ${CI_CACHE_DIR+x} ]]; then
CI_CACHE_DIR="/home/ubuntu/aptcache"
fi;

sudo mkdir -p ${CI_CACHE_DIR}/partial;
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y && \
sudo apt-get -o dir::cache::archives=${CI_CACHE_DIR} update -y && \
sudo apt-get -o dir::cache::archives=${CI_CACHE_DIR} install cmake gcc-6 g++-6 -y && \
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 60 && \
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-6 60 && \
sudo update-alternatives --set gcc /usr/bin/gcc-6 && \
sudo update-alternatives --set g++ /usr/bin/g++-6



rm -r test_build
mkdir test_build
cd test_build
cmake ../ -DBUILD_TEST=ON
make
./testTest