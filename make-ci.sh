#!/bin/bash
# 

machine=$(uname -sm | tr ' ' -)
PKGS="sdx tablelist6.16 img1.4.13 tkdnd2.9 photoresize0.2 tdom0.9.3 vectcl0.3 vectcltk0.2 tclcurl"


# compile kbskit + sdx into build dir
builddir="kbskit_$machine"
MAKEFLAGS=-j4 ./kbs.tcl -r -v -builddir="$(pwd)/$builddir" -make=make -tar=tar install kbskit8.6 $PKGS
# explicit -make=make is needed, because otherwise "gmake" is tried first,
# which is alien under git-sdk on Github Actions Windows

# exit on error
if [ "$?" -ne 0 ]; then 
	exit -1
fi


# remove the build files to save space 
./kbs.tcl -r -v distclean $PKGS

# exit on error
if [ "$?" -ne 0 ]; then 
	exit -1
fi

mkdir -p dist
TARBALL=kbskit_$machine.tar.bz2
tar cvjf "dist/$TARBALL" "$builddir/bin" "$builddir/include" "$builddir/lib" "$builddir/licenses"

# exit on error
if [ "$?" -ne 0 ]; then 
	exit -1
fi


