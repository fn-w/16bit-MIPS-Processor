module RegisterFile(
    output [15:0] R1,
    output [15:0] R2,
    input [3:0] Rs,
    input [3:0] Rt,
    input [15:0] DataIn,
    input RegWrite,
    input reset  ,input clk  );
reg [15:0]Rmem[0:15];
integer i;

		if (reset)
	begin
	for(i=0;i<14;i=i+1)
		Rmem[i]<=16'h0000;
		 Rmem[14]<=16'b1111_1111_1111_1111;		
		 Rmem[15]<=16'b1111_1111_1111_1111;			end


	always @( RegWrite,negedge clk)
	begin
	if(RegWrite)
   #50 Rmem[Rt]=DataIn;
	end

assign R1=Rmem[Rs];
assign  R2=Rmem[Rt];



endmodule
