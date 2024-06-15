# 4-Stage-Pipelined-16-bit-ALU
--> Inputs: 3 register addresses (rs1, rs2, rd) <br/>
	    An ALU Function (func)
	    A memory address

--> Stages of Pipeline
(1) Stage-1: Read two 16-bit numbers from the registers specified by "rs1" and "rs2". Store them in "A" and "B" respectively.
(2) Stage-2: Perform an ALU Operation specified by "func". Store it in "Z".
(3) Stage-3: Write the value of "Z" in register specified by "rd".
(4) Stage-4: Also write the value of "Z" in memory location "'addr".

--> Assumptions:
-> Register bank contains 16 16-bit registers.
-> 4 bits are required to specify a register address.
-> Two registers read and One register write can be performed every clock cycle.
-> Register addresses are "rs1", "rs2" and "rd".
-> Assume that memory is 256 x 16.
-> 8 bits are required to specify memory address.
-> Every memory location consists 16-bit of data which can be read in a single cycle.
-> Memory addresses are specified as "addr".
-> ALU function is selected by a 4-bit field "func", as follows:

0000: ADD : Z = A + B
0001: SUB : Z = A - B
0010: MUL : Z = A * B
0011: SELA : Z = A
0100: SELB : Z = B
0101: AND : Z = A & B
0110: OR : Z = A | B
0111: XOR : Z = A ^ B
1000: NEGA : Z = ~A
1001: NEGB : Z = ~B
1010: SRA : Z = A >> 1
1011: SLA : Z = A << 1

-> I have provided two alternate clocks to every pipeline alternatively to avoid race condition.
