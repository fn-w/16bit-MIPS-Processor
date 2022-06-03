module SignExt5to16(
    output [15:0] Out,
    input [4:0] In
    );
	 reg [10:0]Temp;
	 always@(In)
	 begin
if (In[4]==1'b1)
assign Temp=11'b11111111111;
else if (In[4]==1'b0)
assign Temp=11'b00000000000;
end
assign Out[15:5]=Temp;
assign Out[4:0]=In;
endmodule
