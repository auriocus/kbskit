#!/bin/bash
# 

machine=$(uname -sm | tr ' ' -)

# compile kbskit + sdx into build dir
builddir="kbskit_$machine"
MAKEFLAGS=-j4 ./kbs.tcl -r -v -builddir="$(pwd)/$builddir" install kbskit8.6 sdx

mkdir -p dist
TARBALL=kbskit_$machine.tar.bz2
tar cvjf "dist/$TARBALL" "$builddir/bin" "$builddir/include" "$builddir/lib"

