`timescale 1ns/10ps

module memory_write(clk_40,rst_40,opcode_40,src_reg_40,dest_reg_40,targ_reg_40,alu_out_40,alu_src_40,mem_out1_40,mem_out2_40,opcode_out_40,src_reg_out_40,dest_reg_out_40,targ_reg_out_40,mwr_d_40,mwd_d_40,mwa_d_40,mra_d_40,mrd_d_40,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19, r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31);

input clk_40,rst_40;
input [5:0] opcode_40;
input [5:0] src_reg_40,dest_reg_40,targ_reg_40;
input [31:0] alu_out_40,alu_src_40;
input [31:0] mrd_d_40;

output reg [31:0]mem_out1_40;
output [31:0] mem_out2_40;
output [5:0] opcode_out_40;
output [5:0] src_reg_out_40,dest_reg_out_40,targ_reg_out_40;
output reg [31:0] mra_d_40;
output reg [31:0] mwd_d_40,mwa_d_40;
output reg mwr_d_40;

input [31:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
input [31:0] r10,r11,r12,r13,r14,r15,r16,r17,r18,r19;
input [31:0] r20,r21,r22,r23,r24,r25,r26,r27,r28,r29;
input [31:0] r30,r31;

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

parameter R0 = 5'b00000;
parameter R1 = 5'b00001;
parameter R2 = 5'b00010;
parameter R3 = 5'b00011;
parameter R4 = 5'b00100;
parameter R5 = 5'b00101;
parameter R6 = 5'b00110;
parameter R7 = 5'b00111;
parameter R8 = 5'b01000;
parameter R9 = 5'b01001;
parameter R10 = 5'b01010;
parameter R11 = 5'b01011;
parameter R12 = 5'b01100;
parameter R13 = 5'b01101;
parameter R14 = 5'b01110;
parameter R15 = 5'b01111;
parameter R16 = 5'b10000;
parameter R17 = 5'b10001;
parameter R18 = 5'b10010;
parameter R19 = 5'b10011;
parameter R20 = 5'b10100;
parameter R21 = 5'b10101;
parameter R22 = 5'b10110;
parameter R23 = 5'b10111;
parameter R24 = 5'b11000;
parameter R25 = 5'b11001;
parameter R26 = 5'b11010;
parameter R27 = 5'b11011;
parameter R28 = 5'b11100;
parameter R29 = 5'b11101;
parameter R30 = 5'b11110;
parameter R31 = 5'b11111;

assign opcode_out_40   =  rst_40 ? 5'b0 : opcode_40;
assign src_reg_out_40  =  rst_40 ? 5'b0 : src_reg_40;
assign dest_reg_out_40 =  rst_40 ? 5'b0 : dest_reg_40;
assign targ_reg_out_40 =  rst_40 ? 5'b0 : targ_reg_40;
assign mem_out2_40     =  rst_40 ? 5'b0 : alu_src_40;

  always @(*)
  begin
  if(rst_40)
  begin
    mem_out1_40 = 0;
  end
  else
  begin
    mwr_d_40 = 1'b0;
    case(opcode_40)
      LDW : 
      begin
        mra_d_40 = alu_out_40;
        mem_out1_40 = mrd_d_40;
      end
      STW:
      begin
        mwd_d_40 = alu_src_40;
        mwa_d_40 = alu_out_40;
        mwr_d_40 = 1'b1;
      end
      default : mem_out1_40 = alu_out_40;
    endcase
  end
  end
endmodule

