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
