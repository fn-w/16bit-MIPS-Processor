module AluControl(
    output reg [2:0] AluCon,
    input [1:0] AluOp,
    input [2:0] FunF
    );

always @(AluOp,FunF)
begin
case (AluOp)
	2'b00: AluCon[2:0]=FunF[2:0];
	2'b01: AluCon[2:0]=3'b000;//LW&SW
	2'b10: AluCon[2:0]=3'b001;//Beq
	2'b11: AluCon[2:0]=3'b111;//nothing
	default: AluCon[2:0]=3'b111;//nothing

endcase
end
endmodule
