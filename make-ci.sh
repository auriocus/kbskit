#!/bin/bash
# 

machine=$(uname -sm | tr ' ' -)

# compile kbskit + sdx into build dir
builddir="kbskit_$machine"
MAKEFLAGS=-j4 ./kbs.tcl -r -v -builddir="$(pwd)/$builddir" -make=make install kbskit8.6 sdx tablelist6.16 img1.4.13 tkdnd2.9 photoresize0.2 rl_json0.11.1
# explicit -make=make is needed, because otherwise "gmake" is tried first,
# which is alien under git-sdk on Github Actions Windows

mkdir -p dist
TARBALL=kbskit_$machine.tar.bz2
tar cvjf "dist/$TARBALL" "$builddir/bin" "$builddir/include" "$builddir/lib" "$builddir/licenses"

