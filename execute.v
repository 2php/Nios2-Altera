//-------------EXECUTE---------------

`timescale 1ns/10ps

module execute(clk_40,rst_40,opcode_40,a_40,b_40,sign_ext_40,alu_out_40,alu_src_40,opcode_out_40,src_reg_40,dest_reg_40,targ_reg_40,src_reg_out_40,dest_reg_out_40,targ_reg_out_40);

input clk_40,rst_40;
input [5:0] opcode_40;
input [5:0] src_reg_40,dest_reg_40,targ_reg_40;
input [31:0] a_40,b_40,sign_ext_40;
output [5:0] opcode_out_40;
output reg [31:0] alu_out_40;
output [31:0] alu_src_40;
output [5:0] src_reg_out_40,dest_reg_out_40,targ_reg_out_40;



parameter ADD  = 6'b110001;
parameter LDW  = 6'b010111;
parameter MUL  = 6'b100111;
parameter BLT  = 6'b010110;
parameter STW  = 6'b010101;
parameter BR   = 6'b000110;
parameter ADDI = 6'b000100;
parameter BEQ  = 6'b100110;
parameter BNE  = 6'b011110;
parameter JMP  = 6'b111010;
parameter CALL = 6'b000000;
parameter SUBI = 6'b011111;
parameter NOPE = 6'b111111;



assign opcode_out_40      =  rst_40 ? 0 : opcode_40;
assign src_reg_40_out     =  rst_40 ? 0 : src_reg_40;
assign dest_reg_out_40    =  rst_40 ? 0 : dest_reg_40;
assign targ_reg_out_40    =  rst_40 ? 0 : targ_reg_40;
assign alu_src_40         =  rst_40 ? 0 : b_40;

  always @ (*)
  begin
#0;
    if(rst_40)
    begin
      alu_out_40 = 0;
    end
    else
    begin
      case(opcode_40)
        ADD : alu_out_40 = a_40 + b_40;
        LDW : alu_out_40 = a_40 + sign_ext_40; 
        MUL : alu_out_40 = a_40 * b_40;
        STW : alu_out_40 = a_40 + sign_ext_40;
        ADDI: alu_out_40 = a_40 + sign_ext_40;
        SUBI: alu_out_40 = a_40 - sign_ext_40;
        CALL: alu_out_40 = b_40;
      endcase
    end
  end
endmodule
