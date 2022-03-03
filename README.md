WIP Nix flake for building evm-llvm.

I (@zenhack) have managed to build evm-llvm outside of nix using similar
build steps, but haven't worked out how to convince nix not to do the
build in /tmp, and since LLVM is enormous, and the build takes 10s of
GiB of space, this is unworkable. Simply setting TMPDIR does not seem to
do the trick.
