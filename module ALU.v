module ALU(
    output reg [15:0] DataOut,
    output reg Zero,
	 output reg AG,
    input [15:0] A,
    input [15:0] B,
    input [2:0] AluC

    );
	 initial begin assign DataOut=16'b0;
				Zero=0;
				AG=0;
				end
always@(AluC)
begin
	case (AluC)
	
	3'b000:assign  DataOut=A+B;
	3'b001: assign DataOut=A-B;
	3'b010: assign DataOut=A&B;
	3'b011:  assign DataOut=A|B;
	3'b100:  assign DataOut=A^B;
	3'b101:  assign DataOut=A+B;
	3'b110:  assign DataOut=A+B;
	3'b111:  assign DataOut=16'h0000;
	default  assign DataOut=16'h0000;
	endcase 
	if(DataOut==0)
	assign Zero=1;
	else assign Zero=0;
	if (A[15:0]>B[15:0])
	assign AG=1;
	else AG=0;
end

endmodule
