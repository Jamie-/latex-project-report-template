# Southampton University Project Report Template #

Template for an interim or project report at the University of Southampton.

Many thanks to Huw Jones (@huwcbjones) for some Makefile tricks and fixing some bibliography bugs.

## Compiling the Report ##
You'll need LaTeX and GNU Make to be able to complile this as easily as possible.

Before compiling for the first time, you'll need to create an output directory `mkdir out`.

Now you should be able to compile the report as normal with `make`, and whenever you make any changes to the source, run `make` again to compile.

If anything screws up or stops working, first try running `make clean` and then `make`. Nine times out of ten this should fix it.
