## 4-Stage-Pipelined-16-bit-ALU
#--> Inputs: 3 register addresses (rs1, rs2, rd) <br/>
	    An ALU Function (func)  <br/>
	    A memory address  <br/>

#--> Stages of Pipeline  <br/>
(1) Stage-1: Read two 16-bit numbers from the registers specified by "rs1" and "rs2". Store them in "A" and "B" respectively.  <br/>
(2) Stage-2: Perform an ALU Operation specified by "func". Store it in "Z".  <br/>
(3) Stage-3: Write the value of "Z" in register specified by "rd".  <br/>
(4) Stage-4: Also write the value of "Z" in memory location "'addr".  <br/>

#--> Assumptions:  <br/>
-> Register bank contains 16 16-bit registers.  <br/>
-> 4 bits are required to specify a register address.
-> Two registers read and One register write can be performed every clock cycle. <br/>
-> Register addresses are "rs1", "rs2" and "rd".  <br/>
-> Assume that memory is 256 x 16.  <br/>
-> 8 bits are required to specify memory address.  <br/>
-> Every memory location consists 16-bit of data which can be read in a single cycle.  <br/>
-> Memory addresses are specified as "addr".  <br/>
-> ALU function is selected by a 4-bit field "func", as follows:  <br/>

0000: ADD : Z = A + B  <br/>
0001: SUB : Z = A - B  <br/>
0010: MUL : Z = A * B  <br/>
0011: SELA : Z = A  <br/>
0100: SELB : Z = B  <br/>
0101: AND : Z = A & B  <br/>
0110: OR : Z = A | B  <br/>
0111: XOR : Z = A ^ B  <br/>
1000: NEGA : Z = ~A  <br/>
1001: NEGB : Z = ~B  <br/>
1010: SRA : Z = A >> 1  <br/>
1011: SLA : Z = A << 1  <br/>

-> I have provided two alternate clocks to every pipeline alternatively to avoid race condition.  <br/>
