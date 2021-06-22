#!/bin/bash -ex

export PATH=$(pwd)/depot_tools:$PATH

cd v8/v8

tools/dev/v8gen.py x64.release.sample
ninja -C out.gn/x64.release.sample v8_monolith

cd ..
mkdir build
cp -r v8/include build
