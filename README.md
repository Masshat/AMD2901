# AMD Am2901

![](http://placeholder.fr/~leo/cpu.png)

This is a complete implementation of an [Am2901](http://en.wikipedia.org/wiki/AMD_Am2900)
4-bit ALU slice.

This implementation is done using VLSI techniques and targeted at creating ASICs.
It was done as part of an introductory VLSI course in university. It can be
either simulated using [GHDL](https://gna.org/projects/ghdl/) or converted to
a layout describing the physical placement and connections between all components
at the gate transistor level (see picture above).


tools used in the project:

* GHDL, a VHDL compiler based on GCC.
* Alliance, an open source toolchain for VLSI conception.
