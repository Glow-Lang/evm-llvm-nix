#!/usr/bin/env bash
mkdir tmp
TMPDIR=${PWD}/tmp nix build
rmdir tmp