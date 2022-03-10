#!/usr/bin/env bash

set -eou pipefail

. "$stdenv/setup"
cp -r $src ./evm-llvm
chmod -R u+w evm-llvm
cd evm-llvm
mkdir build
cd build

cmake -GNinja -DLLVM_PARALLEL_LINK_JOBS=1 -DLLVM_TARGETS_TO_BUILD=EVM -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=EVM -DCMAKE_INSTALL_PREFIX=$out ..
ninja -j8 install

