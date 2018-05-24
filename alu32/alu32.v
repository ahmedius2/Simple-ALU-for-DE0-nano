// Ahmet Soyyigit

// In this design, the CPU cycle time must be at least :
// Multiplier clock period(CLK here) * 32 * 2 * 2
// if it is going to be used inside a CPU
module  alu32(CLK, inp1, inp2, ALUop, out);
	input  CLK;
	input  [2:0]  ALUop;
	input  [31:0] inp1;
	input  [31:0] inp2;
	output [31:0] out;
	
	// This is the 4 state FSM
	parameter COMB_STATE       = 2'b00; // Combinational mode
	parameter MULT_CONT_STATE  = 2'b01; // Multiplication continue
	parameter MULT_SHIFT_STATE = 2'b10; // Multiplication shift
	parameter MULT_END_STATE   = 2'b11; // Multiplication end
	
	// 4 states
	reg [1:0]  state      = COMB_STATE;
	reg [1:0]  next_state = COMB_STATE;
	reg [63:0] seqALUResult; // sequential ALU result
	reg [31:0] ALUResult;    // final ALU result
	integer multCounter; // used by multiplier
	
	assign out = ALUResult;
	
	// ALU operations 
	parameter ADD  = 3'b000;
	parameter SUB  = 3'b001;
	parameter MULT = 3'b010;
	parameter AND  = 3'b011;
	parameter OR   = 3'b100;
	parameter NAND = 3'b101;
	parameter NOR  = 3'b110;
	parameter XOR  = 3'b111;
	
	always @(posedge CLK) begin
	
		case(state)
			COMB_STATE: begin
				seqALUResult <= {32'h00000000,inp2};
				multCounter <= 0;
				state <= next_state;
			end	
			MULT_CONT_STATE: begin
				// multiplication continue
				if (multCounter < 32) begin
					seqALUResult[63:32] <= seqALUResult[63:32] + (seqALUResult[0] ? inp1 : 0);
					multCounter <= multCounter + 1;
					state <= MULT_SHIFT_STATE;
				end
				// multiplication finish
				if (multCounter == 32) begin
					state <= MULT_END_STATE;
				end
			end
			MULT_SHIFT_STATE: begin
				// multiplication shift
				seqALUResult <= seqALUResult >> 1;
				state <= MULT_CONT_STATE;
			end
			MULT_END_STATE: begin
				state <= next_state;
			end
			default: begin
			
			end
		endcase
		
	end
	
	// This block represents combinational ALU
	always @(*) begin
	
		case(ALUop)
			ADD: begin
				ALUResult = inp1 + inp2;
			end
			SUB: begin
				ALUResult = inp1 - inp2;
			end
			MULT: begin
				// start multiplication if not started already
				if (state == COMB_STATE) begin
					next_state = MULT_CONT_STATE;
				end
				// end multiplication
				if (state == MULT_END_STATE) begin
					ALUResult = seqALUResult[31:0];
					next_state = COMB_STATE;
				end
				
			end
			AND: begin
				ALUResult = inp1 & inp2;
			end
			OR: begin
				ALUResult = inp1 | inp2;
			end
			NAND: begin
				ALUResult = ~(inp1 & inp2);
			end
			NOR: begin
				ALUResult = ~(inp1 | inp2);
			end
			XOR: begin
				ALUResult = inp1 ^ inp2;
			end
			default: begin
			
			end
		endcase
		
	end
	
endmodule
