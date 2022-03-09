#!/usr/bin/env bash

set -euo pipefail

. "$stdenv/setup"
cp -r $src ./evm-llvm
chmod -R u+w evm-llvm
cd evm-llvm
mkdir build
cd build
cmake -DLLVM_TARGETS_TO_BUILD=EVM -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=EVM -DCMAKE_INSTALL_PREFIX=$out ..
make -j$(( $(nproc) + 1 )) install

