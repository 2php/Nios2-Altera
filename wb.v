//-------------------WRITE BACK---------------
`timescale 1ns/10ps

module rw(clk_40,rst_40,opcode_40,src_reg_40,dest_reg_40,targ_reg_40,mem_out1_40,mem_out2_40,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19, r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31);

input clk_40,rst_40;
input [5:0] opcode_40;
input [5:0] src_reg_40,dest_reg_40,targ_reg_40;
input [31:0] mem_out1_40,mem_out2_40;

output reg [31:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
output reg [31:0] r10,r11,r12,r13,r14,r15,r16,r17,r18,r19;
output reg [31:0] r20,r21,r22,r23,r24,r25,r26,r27,r28,r29;
output reg [31:0] r30,r31;

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

initial 
begin
  r0 = 0;
  r1 = 0;
  r2 = 0;
  r3 = 0;
  r4 = 3;
  r5 = 0;
  r6 = 0;
  r7 = 0;
  r8 = 0;
  r9 = 0;
  r10 = 0;
  r11 = 0;
  r12 = 0;
  r13 = 0;
  r14 = 0;
  r15 = 0;
  r16 = 0;
  r17 = 0;
  r18 = 0;
  r19 = 0;
  r20 = 0;
  r21 = 0;
  r22 = 0;
  r23 = 0;
  r24 = 0;
  r25 = 0;
  r26 = 0;
  r27 = 0;
  r28 = 0;
  r29 = 32'h00000040;
  r30 = 150;
  r31 = 190;
end
  always @(*)
  begin
    case(opcode_40)
      ADD:
      begin
        case(targ_reg_40)
          R0 : r0 = mem_out1_40;
          R1 : r1 = mem_out1_40;
          R2 : r2 = mem_out1_40;
          R3 : r3 = mem_out1_40;
          R4 : r4 = mem_out1_40;
          R5 : r5 = mem_out1_40;
          R6 : r6 = mem_out1_40;
          R7 : r7 = mem_out1_40;
          R8 : r8 = mem_out1_40;
          R9 : r9 = mem_out1_40;
          R10 : r10 = mem_out1_40;
          R11 : r11 = mem_out1_40;
          R12 : r12 = mem_out1_40;
          R13 : r13 = mem_out1_40;
          R14 : r14 = mem_out1_40;
          R15 : r15 = mem_out1_40;
          R16 : r16 = mem_out1_40;
          R17 : r17 = mem_out1_40;
          R18 : r18 = mem_out1_40;
          R19 : r19 = mem_out1_40;
          R20 : r20 = mem_out1_40;
          R21 : r21 = mem_out1_40;
          R22 : r22 = mem_out1_40;
          R23 : r23 = mem_out1_40;
          R24 : r24 = mem_out1_40;
          R25 : r25 = mem_out1_40;
          R26 : r26 = mem_out1_40;
          R27 : r27 = mem_out1_40;
          R28 : r28 = mem_out1_40;
          R29 : r29 = mem_out1_40;
          R30 : r30 = mem_out1_40;
          R31 : r31 = mem_out1_40;
        endcase
      end
      LDW:
      begin
        case(dest_reg_40)
          R0 : r0 = mem_out1_40;
          R1 : r1 = mem_out1_40;
          R2 : r2 = mem_out1_40;
          R3 : r3 = mem_out1_40;
          R4 : r4 = mem_out1_40;
          R5 : r5 = mem_out1_40;
          R6 : r6 = mem_out1_40;
          R7 : r7 = mem_out1_40;
          R8 : r8 = mem_out1_40;
          R9 : r9 = mem_out1_40;
          R10 : r10 = mem_out1_40;
          R11 : r11 = mem_out1_40;
          R12 : r12 = mem_out1_40;
          R13 : r13 = mem_out1_40;
          R14 : r14 = mem_out1_40;
          R15 : r15 = mem_out1_40;
          R16 : r16 = mem_out1_40;
          R17 : r17 = mem_out1_40;
          R18 : r18 = mem_out1_40;
          R19 : r19 = mem_out1_40;
          R20 : r20 = mem_out1_40;
          R21 : r21 = mem_out1_40;
          R22 : r22 = mem_out1_40;
          R23 : r23 = mem_out1_40;
          R24 : r24 = mem_out1_40;
          R25 : r25 = mem_out1_40;
          R26 : r26 = mem_out1_40;
          R27 : r27 = mem_out1_40;
          R28 : r28 = mem_out1_40;
          R29 : r29 = mem_out1_40;
          R30 : r30 = mem_out1_40;
          R31 : r31 = mem_out1_40;
        endcase
      end
      MUL:
      begin
        case(targ_reg_40)
          R0 : r0 = mem_out1_40;
          R1 : r1 = mem_out1_40;
          R2 : r2 = mem_out1_40;
          R3 : r3 = mem_out1_40;
          R4 : r4 = mem_out1_40;
          R5 : r5 = mem_out1_40;
          R6 : r6 = mem_out1_40;
          R7 : r7 = mem_out1_40;
          R8 : r8 = mem_out1_40;
          R9 : r9 = mem_out1_40;
          R10 : r10 = mem_out1_40;
          R11 : r11 = mem_out1_40;
          R12 : r12 = mem_out1_40;
          R13 : r13 = mem_out1_40;
          R14 : r14 = mem_out1_40;
          R15 : r15 = mem_out1_40;
          R16 : r16 = mem_out1_40;
          R17 : r17 = mem_out1_40;
          R18 : r18 = mem_out1_40;
          R19 : r19 = mem_out1_40;
          R20 : r20 = mem_out1_40;
          R21 : r21 = mem_out1_40;
          R22 : r22 = mem_out1_40;
          R23 : r23 = mem_out1_40;
          R24 : r24 = mem_out1_40;
          R25 : r25 = mem_out1_40;
          R26 : r26 = mem_out1_40;
          R27 : r27 = mem_out1_40;
          R28 : r28 = mem_out1_40;
          R29 : r29 = mem_out1_40;
          R30 : r30 = mem_out1_40;
          R31 : r31 = mem_out1_40;
        endcase
      end
      ADDI:
      begin
        case(dest_reg_40)
          R0 : r0 = mem_out1_40;
          R1 : r1 = mem_out1_40;
          R2 : r2 = mem_out1_40;
          R3 : r3 = mem_out1_40;
          R4 : r4 = mem_out1_40;
          R5 : r5 = mem_out1_40;
          R6 : r6 = mem_out1_40;
          R7 : r7 = mem_out1_40;
          R8 : r8 = mem_out1_40;
          R9 : r9 = mem_out1_40;
          R10 : r10 = mem_out1_40;
          R11 : r11 = mem_out1_40;
          R12 : r12 = mem_out1_40;
          R13 : r13 = mem_out1_40;
          R14 : r14 = mem_out1_40;
          R15 : r15 = mem_out1_40;
          R16 : r16 = mem_out1_40;
          R17 : r17 = mem_out1_40;
          R18 : r18 = mem_out1_40;
          R19 : r19 = mem_out1_40;
          R20 : r20 = mem_out1_40;
          R21 : r21 = mem_out1_40;
          R22 : r22 = mem_out1_40;
          R23 : r23 = mem_out1_40;
          R24 : r24 = mem_out1_40;
          R25 : r25 = mem_out1_40;
          R26 : r26 = mem_out1_40;
          R27 : r27 = mem_out1_40;
          R28 : r28 = mem_out1_40;
          R29 : r29 = mem_out1_40;
          R30 : r30 = mem_out1_40;
          R31 : r31 = mem_out1_40;
        endcase
      end
      CALL :
      begin
        r31 = mem_out2_40;
      end
      SUBI:
      begin
        case(dest_reg_40)
          R0 : r0 = mem_out1_40;
          R1 : r1 = mem_out1_40;
          R2 : r2 = mem_out1_40;
          R3 : r3 = mem_out1_40;
          R4 : r4 = mem_out1_40;
          R5 : r5 = mem_out1_40;
          R6 : r6 = mem_out1_40;
          R7 : r7 = mem_out1_40;
          R8 : r8 = mem_out1_40;
          R9 : r9 = mem_out1_40;
          R10 : r10 = mem_out1_40;
          R11 : r11 = mem_out1_40;
          R12 : r12 = mem_out1_40;
          R13 : r13 = mem_out1_40;
          R14 : r14 = mem_out1_40;
          R15 : r15 = mem_out1_40;
          R16 : r16 = mem_out1_40;
          R17 : r17 = mem_out1_40;
          R18 : r18 = mem_out1_40;
          R19 : r19 = mem_out1_40;
          R20 : r20 = mem_out1_40;
          R21 : r21 = mem_out1_40;
          R22 : r22 = mem_out1_40;
          R23 : r23 = mem_out1_40;
          R24 : r24 = mem_out1_40;
          R25 : r25 = mem_out1_40;
          R26 : r26 = mem_out1_40;
          R27 : r27 = mem_out1_40;
          R28 : r28 = mem_out1_40;
          R29 : r29 = mem_out1_40;
          R30 : r30 = mem_out1_40;
          R31 : r31 = mem_out1_40;
        endcase
      end
    endcase
  end
endmodule

