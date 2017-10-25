test.html : driver.o alu.o control.o clock.o cpu.o datapath.o memory.o shifter.o
	emcc --emrun -o test.html driver.o alu.o control.o clock.o cpu.o datapath.o memory.o shifter.o --embed-file data -s NO_EXIT_RUNTIME=1

mic1 : driver.o alu.o control.o clock.o cpu.o datapath.o memory.o shifter.o 
	gcc -o mic1 driver.o alu.o control.o clock.o cpu.o datapath.o memory.o shifter.o
driver.o: driver.c globals.h
	emcc -c -g --emrun driver.c 
alu.o: alu.c globals.h
	emcc -c -g --emrun alu.c
control.o: control.c globals.h
	emcc -c -g --emrun control.c
clock.o: clock.c 
	emcc -c -g --emrun clock.c
cpu.o: cpu.c globals.h
	emcc -c -g --emrun cpu.c
datapath.o: datapath.c  globals.h
	emcc -c -g --emrun datapath.c
memory.o: memory.c globals.h
	emcc -c -g  --emrun memory.c 
shifter.o: shifter.c globals.h
	emcc -c -g --emrun shifter.c
clean:
	rm *.o
