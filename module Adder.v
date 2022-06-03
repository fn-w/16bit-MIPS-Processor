module Adder(
    output reg[15:0] Out,
    input [15:0] In
    );
always@(In)
assign Out=In+16'h0001;
endmodule
