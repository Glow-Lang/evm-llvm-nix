#!/usr/bin/env bash

set -euo pipefail

. "$stdenv/setup"

cp -r $src ./evm-llvm
chmod -R u+w evm-llvm
cd evm-llvm
mkdir build
cd build
cmake -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=EVM ..
make -j$(( $(nproc) + 1 ))
