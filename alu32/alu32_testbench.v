// Ahmet Soyyigit
// 161041024

module alu32_testbench;
	reg [2:0]  ALUop;
	reg [31:0] inp1;
	reg [31:0] inp2;
	wire [31:0] out;
	reg CLK;
	
	initial CLK=0;
	always #5 CLK=~CLK;

// Uncomment this if you want to simulate	
//	alu32 myALU32(CLK,inp1,inp2,ALUop,out);
	
	initial
	begin
	
	inp1 = 32'h00000005;
	inp2 = 32'h00000009;
	ALUop= 3'b000;
	#1280;
	inp1 = 32'h00000005;
	inp2 = 32'h00000009;
	ALUop= 3'b010;
	#1280;
	inp1 = 32'h00000008;
	inp2 = 32'h0000000C;
	ALUop= 3'b000;
	#1280;
	inp1 = 32'h00000008;
	inp2 = 32'h0000000C;
	ALUop= 3'b010;
	#1280;
	inp1 = 32'h00000003;
	inp2 = 32'h00000007;
	ALUop= 3'b010;
	#1280;
	ALUop= 3'b011;
	#1280;
	ALUop= 3'b100;
	#1280;
	ALUop= 3'b011;
	#1280;
	
	end
	

endmodule
