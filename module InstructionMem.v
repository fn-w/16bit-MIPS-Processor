module InstructionMem(
    output reg [15:0] Instruction,
    input [15:0] InstructionAddress
    );
	initial 	assign  Instruction=16'b000_0000_0000_00_000;

   always@(InstructionAddress)
	begin
	case(InstructionAddress)
	
	16'h0000:
	assign Instruction=16'b000_1111_1110_00_000;//rformat add
	16'h0001:
	assign Instruction=16'b000_1111_1110_00_001;//rformat sub
	16'h0002:
	assign Instruction=16'b000_1111_1110_00_011;//rformat and
	16'h0003:
	assign Instruction=16'b011_1111_1110_00010;//
	16'h0004:
	assign Instruction=16'b001_0000_1000_01000;//
	16'h0005:
	assign Instruction=16'b010_0000_1000_01001;//SW
	16'h0006:
	assign Instruction=16'b100_0000_0000_00000;//Sw
	
	default:assign  Instruction=16'b000_0000_0000_00_000;
	endcase
	end

endmodule
