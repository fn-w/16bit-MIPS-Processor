module Mux4to1(
    output reg [15:0] Out,
    input [15:0] In0,
    input [15:0] In1,
    input [15:0] In2,
    input [15:0] In3,
    input Sel1,
    input Sel0
    );
wire [1:0]Sel;
assign Sel[1]=Sel1;
assign Sel[0]=Sel0;
//initial Out=16'b0;

always@(Sel)
begin
	case(Sel)
	2'b00:assign Out=In0;
	2'b01:assign  Out=In1;
	2'b10:assign Out=In2;
	2'b11:assign Out=In3;	
	default:assign Out=16'b0;
	endcase
end
endmodule
