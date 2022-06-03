module SignExt(
    output [15:0] Out,
    input [12:0] OffsetJ,
    input [2:0] StartPC
    );
	 
assign Out[12:0]=OffsetJ[12:0];
assign Out[15:13]=StartPC;
endmodule
