#!/bin/bash -ex

export PATH=$(pwd)/depot_tools:$PATH

rm -rf v8
mkdir v8
cd v8
fetch v8

cd v8
git checkout $COMMIT
gclient sync
