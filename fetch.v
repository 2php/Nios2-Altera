`timescale 1ns/10ps

module fetch(clk_40,rst_40,mra_i_40,mrd_i_40,PC_in_40,NPC_40,IR_40,PC_sel_40);
input clk_40,rst_40;					
input PC_sel_40;                           // used to select new pc line or not 
input [31:0] mrd_i_40;			   
input [31:0] PC_in_40;                     
output reg [31:0] NPC_40;                  
output reg [31:0]mra_i_40;
output [31:0] IR_40;
reg [31:0] PC_40;

assign IR_40 = mrd_i_40;
  always @(posedge clk_40 or posedge rst_40)
  begin
  if(rst_40)
  begin
    PC_40 = 0;
  end
  else
  begin  
    PC_40 = PC_sel_40 ? PC_in_40 : PC; 
    mra_i_40 = rst_40 ? 32'bz :PC;
    
    PC_40 = PC_40 + 4;
    NPC_40 = PC_sel_40 ? PC_in_40 : PC; 
    $display("Instructiojn in the first stage:  %b",IR_40);
  
  end
  end
endmodule
