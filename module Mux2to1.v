module Mux2to1(
    output reg [15:0] Out,
    input [15:0] In0,
    input [15:0] In1,
    input Sel
    );
	 //initial assign Out=16'b0;

always@(Sel)
begin
	case(Sel)
	1'b0:assign  Out=In0;
	1'b1: assign Out=In1;
	//default:assign Out=16'b0;
	endcase
end

endmodule
