// Code your design here
module pipe_ALU (Zout, rs1, rs2, rd, func, addr, clk1, clk2);
input [3:0] rs1, rs2, rd, func;
input [7:0] addr;
input clk1, clk2;
output [15:0] Zout;

reg [15:0] L12_A, L12_B, L23_Z, L34_Z;
reg [3:0] L12_rd, L12_func, L23_rd;
reg [7:0] L12_addr, L23_addr, L34_addr;

reg [15:0] regbank [0:15];  // register bank
reg [15:0] mem [0:255];  // 256 x 16 memory

assign Zout = L34_Z;

always @(posedge clk1)
begin
	L12_A <= #2 regbank[rs1];
	L12_B <= #2 regbank[rs2];
	L12_rd <= #2 rd;
	L12_func <= #2 func;
	L12_addr <= #2 addr;
											// Stage-1
end

always @(negedge clk2)
begin
	case(func)
		0: L23_Z <= #2 L12_A + L12_B; // ADD
		1: L23_Z <= #2 L12_A - L12_B; // SUB
		2: L23_Z <= #2 L12_A * L12_B; // MUL
		3: L23_Z <= #2 L12_A;         // SELA
		4: L23_Z <= #2 L12_B;         // SELB
		5: L23_Z <= #2 L12_A & L12_B; // AND
		6: L23_Z <= #2 L12_A | L12_B; // OR
		7: L23_Z <= #2 L12_A ^ L12_B; // XOR
		8: L23_Z <= #2 ~L12_A;        // NEGA
		9: L23_Z <= #2 ~L12_B;        // NEGB
		10: L23_Z <= #2 L12_A >> 1;   // SRA
		11: L23_Z <= #2 L12_A << 1;   // SLA
		default: L23_Z <= #2 16'hxxxx;
	endcase
	L23_rd <= #2 L12_rd;
	L23_addr <= #2 L12_addr;
												// Stage-2
end

always @(posedge clk1)
begin
	regbank[L23_rd] <= #2 L23_Z;
	L34_Z <= #2 L23_Z;
	L34_addr <= #2 L23_addr;
											// stage-3
end

always @(negedge clk2)
begin
	mem[L34_addr] <= #2 L34_Z;
											// Stage-4
end
endmodule