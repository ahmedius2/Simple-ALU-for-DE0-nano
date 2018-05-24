// Ahmet Soyyigit

module  alu32interface(CLK, ALUop, pushButton1, pushButton2, out, rst);
	input CLK;
	input  [2:0]  ALUop;
	input rst;
	input pushButton1;
	input pushButton2;
	
	output [31:0] out;
	
	reg  [31:0] inp1 = 32'h00000000;
	reg  [31:0] inp2 = 32'h00000000;
	
	alu32 myALU32(CLK,inp1,inp2,ALUop,out);
	
	// Increase number 1 when pushbutton1 is pressed
	// if push button is pressed while the reset is
	// active, reset number 1.
	always @(negedge pushButton1) begin
		if(rst) begin
			inp1 <= 32'h00000000;
		end
		else begin
			inp1 <= inp1 + 1;
		end
	end
	
	// Increase number 2 when pushbutton1 is pressed
	// if push button is pressed while the reset is
	// active, reset number 2.
	always @(negedge pushButton2) begin
		if(rst) begin
			inp2 <= 32'h00000000;
		end
		else begin
			inp2 <= inp2 + 1;
		end
	end


endmodule
