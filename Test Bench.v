module t_new;
	// Inputs
	reg clk;
	reg reset;
	// Outputs
	wire [15:0] MemOut;
	wire [15:0] AluRes;
	wire [15:0]DataIn;
	wire [2:0]FunF;
	wire [1:0]AluOp;
	wire [2:0] AluCon;
	wire [15:0] InstructionOut;
	wire MtoR;
	wire RegWrite;
	wire MemRead;
	wire MemWrite;
	wire [15:0] R1;
	wire [15:0] R2;
	wire [15:0]AluR2;
	wire [3:0] Rs;
	wire [3:0] Rt;
	wire [15:0] In0;
	wire [15:0] In1;
	
	wire [15:0] In2;
	wire [15:0] Mout;
	wire [15:0] Pout;
	
	wire [15:0] W8;
	 wire [15:0] W9;
	 wire [15:0] W10;
	 wire [15:0] W11;

	// Instantiate the Unit Under Test (UUT
	Main uut (
		.MemOut(MemOut), 
		.AluRes(AluRes), 
		.clk(clk), 
		.reset(reset),
		.DataIn(DataIn),
		.FunF(FunF),
		.AluOp(AluOp),
		.AluCon(AluCon),
		.InstructionOut(InstructionOut), 
		.MtoR(MtoR),
		.RegWrite(RegWrite),
		.MemRead(MemRead),
		.MemWrite(MemWrite),
		  .R1(R1), 
		.R2(R2),
                                    .AluR2(AluR2),		
		.Rs(Rs), 
		.Rt(Rt), 
		.In0(In0), 
		.In1(In1), 
		.In2(In2), 
		.Mout(Mout), 
		.Pout(Pout),
		.W8(W8),
		.W9(W9),
		.W10(W10),
		.W11(W11),
		.clk1(clk1)
	);
initial begin
clk1=0;
forever #50 clk1=~clk1;
end
initial begin
clk=0;
forever #100 clk=~clk;
end
	initial begin
		// Initialize Input

		// Wait 100 ns for global reset to finish

       reset=1;
		// Add stimulus here
	#100
	reset=0;	end
      
endmodule

