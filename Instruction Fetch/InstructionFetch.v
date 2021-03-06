`include "Instruction.v"
module InstructionFetch(input clk,input reset, output [15:0]out);

reg [15:0]Imem[0:1023];

reg [15:0]ProgramCounter;

initial begin
	ProgramCounter <=16'b0;
end

initial begin
	Imem[0]<=16'b1;
	Imem[1] <= 16'b101;
	Imem[2]<=16'b111;
	Imem[3]<=16'b110;
	Imem[4]<=16'b1001;
end
wire w0;
wire [15:0]temp;//storing pc
reg [15:0]temp1;//for storing ouput data from register
Instrcution ins_1(ProgramCounter,16'd1,1'b0,temp,w0);

always@(posedge clk or posedge reset)
	if(!reset)
	begin
        temp1 <=Imem[temp];
        ProgramCounter <= temp;
	     		 
 	end
	else
	begin
		ProgramCounter <= 16'b1111111111111111;
	end
		
assign out = temp1;

endmodule
