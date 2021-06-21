#!/bin/bash -ex

VERSION=9.1

export PATH=$(pwd)/depot_tools:$PATH

rm -rf v8
mkdir v8
cd v8
fetch v8

cd v8
git checkout branch-heads/$VERSION
gclient sync
sudo apt update && sudo apt remove php7.4-common && sudo apt autoremove
./build/install-build-deps.sh
tools/dev/v8gen.py x64.release.sample
ninja -C out.gn/x64.release.sample v8_monolith
