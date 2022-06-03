module ControlUnit(
    output reg J,
    output reg Beq,
	 output reg JmpG,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg MtoR,
    output reg AluSource,
    output reg [1:0] AluOp,
    input [2:0] OpCode
    );
parameter Rformat=3'b000,LoadW=3'b001,StoreW=3'b010,BranchEq=3'b011,Jump=3'b100,JmpG1=3'b111;
always@(OpCode)
begin
	case(OpCode)
	Rformat:
	  begin
	 assign J=1'b0;
    assign Beq=1'b0;
	 assign JmpG=1'b0;
    assign RegWrite=1'b1;
    assign MemRead=1'b0;
    assign MemWrite=1'b0;
    assign MtoR=1'b0;
    assign AluSource=1'b0;
    assign AluOp=2'b00;
	  end
	LoadW:
	  begin
	assign  J=1'b0;
   assign  Beq=1'b0;
	assign JmpG=1'b0;
   assign  RegWrite=1'b1;
   assign  MemRead=1'b1;
   assign  MemWrite=1'b0;
   assign  MtoR=1'b1;
   assign  AluSource=1'b1;
   assign  AluOp=2'b01;//Add
	  end
	StoreW:
	  begin
	assign  J=1'b0;
   assign  Beq=1'b0;
	assign JmpG=1'b0;
   assign  RegWrite=1'b0;
   assign  MemRead=1'b0;
   assign  MemWrite=1'b1;
    assign MtoR=1'b1;
    assign AluSource=1'b1;
    assign AluOp=2'b01;//Add
	  end
	BranchEq:
	  begin
	assign  J=1'b0;
   assign  Beq=1'b1;
	assign JmpG=1'b0;
   assign  RegWrite=1'b0;
    assign MemRead=1'b0;
    assign MemWrite=1'b0;
    assign MtoR=1'b0;
    assign AluSource=1'b0;
    assign AluOp=2'b10;//Sub
	  end
	Jump:
	  begin
	assign  J=1'b1;
   assign  Beq=1'b0;
	assign JmpG=1'b0;
   assign  RegWrite=1'b0;
   assign  MemRead=1'b0;
   assign  MemWrite=1'b0;
   assign   MtoR=1'b0;
   assign  AluSource=1'b0;
   assign  AluOp=2'b11;//nothing
	  end
	  JmpG1:
	  begin
	assign  J=1'b0;
   assign  Beq=1'b0;
	assign JmpG=1'b1;
   assign  RegWrite=1'b0;
    assign MemRead=1'b0;
    assign MemWrite=1'b0;
    assign MtoR=1'b0;
    assign AluSource=1'b0;
    assign AluOp=2'b11;//Sub
	  end
	default:
	  begin
	assign  J=1'b0;
   assign  Beq=1'b0;
	assign JmpG=1'b0;
   assign  RegWrite=1'b0;
   assign  MemRead=1'b0;
   assign  MemWrite=1'b0;
    assign MtoR=1'b0;//0
    assign AluSource=1'b0;
    assign AluOp=2'b00;//nothing
	  end

	endcase
end
endmodule
