all : amd_tb
ram.o : ram.vhdl
	ghdl -a -v ram.vhdl

accu.o : accu.vhdl
	ghdl -a -v accu.vhdl
	
muxs.o : muxs.vhdl
	ghdl -a -v muxs.vhdl

muxe.o : muxe.vhdl
	ghdl -a -v muxe.vhdl

alu.o : alu.vhdl
	ghdl -a -v alu.vhdl

amd2901.o : amd2901.vhdl alu.o muxe.o muxs.o accu.o ram.o  
	ghdl -a -v amd2901.vhdl

amd_iss.o : amd_iss.vhdl
	ghdl -a -v amd_iss.vhdl

amd_tb.o : amd_tb.vhdl
	ghdl -a -v amd_tb.vhdl

std_log2c.o : std_log2c.c
	gcc -Wall -c  std_log2c.c

amd_iss_c.o : amd_iss_c.s
	gcc -Wall -c  amd_iss_c.s

amd_tb : amd_iss.o amd_tb.o amd2901.o amd_iss_c.o std_log2c.o
	ghdl -e -v -Wl,amd_iss_c.o -Wl,std_log2c.o amd_tb

run : amd_tb
	ghdl -r amd_tb --vcd=amd_tb.vcd

clean :
	rm *.o amd_tb work-obj93.cf
