module DataMem(
    output reg [15:0] DataOut,
    input [15:0] DataIn,
    input [15:0] BaseAdd,
    input ReadMem,
    input WriteMem,
	 input reset,
	 input clk,
	 output [15:0] W8,
	 output [15:0] W9,
	 output [15:0] W10,
	 output [15:0] W11
    );
 reg [15:0]Mem[0:65535];
 integer i;
 always@(reset)
 begin
 if (reset)
 begin
 for(i=0;i<65536;i=i+1)
 if(i==8|i==9|i==10|i==11)
 begin Mem[8]=16'hFFFF;
			Mem[9]=16'h000F;
			Mem[10]=16'h00FF;
			Mem[11]=16'h0FFF;
			end
	else
 Mem[i]=16'h0000;
 DataOut=16'h0000;
 end
 end

 always @(posedge clk,BaseAdd)
 begin
 if (ReadMem)
	 DataOut=Mem[BaseAdd];
 if (WriteMem==1)
	begin
	 Mem[BaseAdd]=DataIn;           
	// DataOut=16'h0000;
	end


end
assign	 W8=Mem[8];
assign	 W9=Mem[9];
assign	 W10=Mem[10];
assign	 W11=Mem[11];
endmodule
