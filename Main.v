module Main(
    output [15:0] MemOut,
    output [15:0] AluRes,
    input clk,
    input reset,
	 output [15:0]DataIn,
output [2:0]FunF,
output [1:0]AluOp,	
	output [2:0]AluCon,
	 output [15:0]InstructionOut,
	 output MtoR,
	     output RegWrite,
    output MemRead,
	 output MemWrite,
	 output [15:0]R1,
	 output [15:0]R2,
	 output [15:0]AluR2,
	 output [3:0]Rs,
	 output [3:0]Rt,
	 output [15:0]In0,
	 output [15:0]In1,
	 output [15:0]In2,
	 output [15:0]Mout,
	 output reg [15:0]Pout,
	 output [15:0] W8,
	 output [15:0] W9,
	 output [15:0] W10,
	 output [15:0] W11,
		input clk1
  
  );
	 wire J;
                 wire Beq;
	 wire JmpG;
                wire AluSource;
	 wire [15:0]ExtendedOff;
	 wire Zero,AG;
	 wire [12:0]OffJ;
	
//Program Counter
Mux4to1 Mux1(Mout,In0,In1,In2,In2,Sel1,Sel0);
	 always@(posedge clk, reset)
	 begin
	 if (reset)
	Pout=16'h0000;
	else 
	Pout=Mout;
	end

Adder Adder1(In0,Pout);
InstructionMem Instruction1(InstructionOut,Pout);
ControlUnit Control1(J,Beq,JmpG,RegWrite,MemRead,MemWrite,MtoR,AluSource,AluOp,InstructionOut[15:13]);

assign Rs=InstructionOut[12:9];
assign Rt=InstructionOut[8:5];
RegisterFile RegF1(R1,R2,Rs,Rt,DataIn,RegWrite,reset,clk);

SignExt5to16 Sign1(ExtendedOff,InstructionOut[4:0]);
Mux2to1 Mux2(AluR2,R2,ExtendedOff,AluSource);
assign FunF=InstructionOut[2:0];

AluControl AluCon1(AluCon,AluOp,FunF);
ALU ALU1(AluRes,Zero,AG,R1,AluR2,AluCon);

DataMem DataMem1(MemOut,R2,AluRes,MemRead,MemWrite,reset,clk,W8,W9,W10,W11);
Mux2to1 Mux3(DataIn,AluRes,MemOut,MtoR);

AddOffB Addoff1(In1,ExtendedOff,In0);
assign OffJ=InstructionOut[12:0];

SignExt Sign2(In2,OffJ,In0[15:13]);

assign Sel1=J;
assign Sel0= Beq&Zero;
//wire S1;
//assign S1=JmpG&&AG;
//assign Sel1=J|S1;
//assign Sel0= Beq&Zero|S1;
endmodule