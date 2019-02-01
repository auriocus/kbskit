kbskit
======
kbskit is a framework to generate TclkitLite executables, compile Tcl packages and build kit files for different operating systems.
Initially by Rene Zaumseil, this fork was updated by Christian Gollwitzer (auriocus) to the recent
versions of Tcl/Tk and tested under macOS 10.13

How to run
==========

After cloning, execute kbs.tcl:

	./kbs.tcl -r install tk8.6

If you want a full kbskit (single file executable with many packages), run:

	./kbs.tcl -r install __

For parallel builds, prefix your invocation with 
	MAKEFLAGS=-j4 
	
(4 is the number of cpu cores in this example)
