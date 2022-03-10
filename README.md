WIP Nix flake for building evm-llvm.


# Usage

To build evm-llvm just run

`nix build` in the evm-llvm-nix directory

Since llvm is a very large build and since nix builds in TMPDIR by default, this can cause memory over-use problems in systems where /tmp is a tmpfs (like some linux distros).

To solve this, run:
`TMPDIR=/var/tmp nix build`

This tells nix to build in `/var/tmp` without actually changing the TMPDIR environment variable.

