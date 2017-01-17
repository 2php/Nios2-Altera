`timescale 1ns/10ps

module decode(clk_40,rst_40,IR_40,PC_40,a_40,b_40,NPC_40,PC_sel_40,sign_ext_40,opcode_40,src_reg_40,dest_reg_40,targ_reg_40,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19, r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31);

input clk_40,rst_40;
input [31:0] IR_40;
input [31:0] PC_40;
output reg [31:0] a_40,b_40;
output reg [31:0] NPC_40;
output reg PC_sel_40;
output reg [31:0] sign_ext_40;
output [5:0] opcode_40;
output [5:0] src_reg_40;
output [5:0] dest_reg_40;
output [5:0] targ_reg_40;


input [31:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
input [31:0] r10,r11,r12,r13,r14,r15,r16,r17,r18,r19;
input [31:0] r20,r21,r22,r23,r24,r25,r26,r27,r28,r29;
input [31:0] r30,r31;

wire [5:0] j;

parameter R0 =  5'b00000;
parameter R1 =  5'b00001;
parameter R2 =  5'b00010;
parameter R3 =  5'b00011;
parameter R4 =  5'b00100;
parameter R5 =  5'b00101;
parameter R6 =  5'b00110;
parameter R7 =  5'b00111;
parameter R8 =  5'b01000;
parameter R9 =  5'b01001;
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

assign opcode_40 = rst_40 ? 6'b000000 : IR_40[5:0];
assign src_reg_40 = rst_40 ? 5'b000000 : IR_40[31:27];
assign dest_reg_40 = rst_40 ? 5'b000000 : IR_40[26:22];
assign targ_reg_40 = rst_40 ? 5'b000000 : IR_40[21:17];
assign j = rst_40 ? 5'b000000 : IR_40[16:11];


  always @(*)
  begin
  if(rst_40)
  begin
    NPC_40 = 0;
    PC_sel_40 = 0;
    sign_ext_40 = 0;
    a_40= 0;
    b_40= 0;
  end
  
  else
  begin
  PC_sel_40 = 1'b0;
    case(opcode_40)
      ADD:
      begin
        case(src_reg_40)
          R0 : a_40 = r0;
          R1 : a_40 = r1;
          R2 : a_40 = r2;
          R3 : a_40 = r3;
          R4 : a_40 = r4;
          R5 : a_40 = r5;
          R6 : a_40 = r6;
          R7 : a_40 = r7;
          R8 : a_40 = r8;
          R9 : a_40 = r9;
          R10 : a_40 = r10;
          R11 : a_40 = r11;
          R12 : a_40 = r12;
          R13 : a_40 = r13;
          R14 : a_40 = r14;
          R15 : a_40 = r15;
          R16 : a_40 = r16;
          R17 : a_40 = r17;
          R18 : a_40 = r18;
          R19 : a_40 = r19;
          R20 : a_40 = r20;
          R21 : a_40 = r21;
          R22 : a_40 = r22;
          R23 : a_40 = r23;
          R24 : a_40 = r24;
          R25 : a_40 = r25;
          R26 : a_40 = r26;
          R27 : a_40 = r27;
          R28 : a_40 = r28;
          R29 : a_40 = r29;
          R30 : a_40 = r30;
          R31 : a_40 = r31;
        endcase
        case(dest_reg_40)
          R0 : b_40 = r0;
          R1 : b_40 = r1;
          R2 : b_40 = r2;
          R3 : b_40 = r3;
          R4 : b_40 = r4;
          R5 : b_40 = r5;
          R6 : b_40 = r6;
          R7 : b_40 = r7;
          R8 : b_40 = r8;
          R9 : b_40 = r9;
          R10 : b_40 = r10;
          R11 : b_40 = r11;
          R12 : b_40 = r12;
          R13 : b_40 = r13;
          R14 : b_40 = r14;
          R15 : b_40 = r15;
          R16 : b_40 = r16;
          R17 : b_40 = r17;
          R18 : b_40 = r18;
          R19 : b_40 = r19;
          R20 : b_40 = r20;
          R21 : b_40 = r21;
          R22 : b_40 = r22;
          R23 : b_40 = r23;
          R24 : b_40 = r24;
          R25 : b_40 = r25;
          R26 : b_40 = r26;
          R27 : b_40 = r27;
          R28 : b_40 = r28;
          R29 : b_40 = r29;
          R30 : b_40 = r30;
          R31 : b_40 = r31;
        endcase
      end
      LDW:
      begin
        case(src_reg_40)
          R0 : a_40 = r0;
          R1 : a_40 = r1;
          R2 : a_40 = r2;
          R3 : a_40 = r3;
          R4 : a_40 = r4;
          R5 : a_40 = r5;
          R6 : a_40 = r6;
          R7 : a_40 = r7;
          R8 : a_40 = r8;
          R9 : a_40 = r9;
          R10 : a_40 = r10;
          R11 : a_40 = r11;
          R12 : a_40 = r12;
          R13 : a_40 = r13;
          R14 : a_40 = r14;
          R15 : a_40 = r15;
          R16 : a_40 = r16;
          R17 : a_40 = r17;
          R18 : a_40 = r18;
          R19 : a_40 = r19;
          R20 : a_40 = r20;
          R21 : a_40 = r21;
          R22 : a_40 = r22;
          R23 : a_40 = r23;
          R24 : a_40 = r24;
          R25 : a_40 = r25;
          R26 : a_40 = r26;
          R27 : a_40 = r27;
          R28 : a_40 = r28;
          R29 : a_40 = r29;
          R30 : a_40 = r30;
          R31 : a_40 = r31;
        endcase
        sign_ext_40 = IR_40[21] ? {16'hFFFF,IR_40[21:6]} : {16'h0000,IR_40[21:6]};
      end
      MUL:
      begin
        case(src_reg_40)
          R0 : a_40 = r0;
          R1 : a_40 = r1;
          R2 : a_40 = r2;
          R3 : a_40 = r3;
          R4 : a_40 = r4;
          R5 : a_40 = r5;
          R6 : a_40 = r6;
          R7 : a_40 = r7;
          R8 : a_40 = r8;
          R9 : a_40 = r9;
          R10 : a_40 = r10;
          R11 : a_40 = r11;
          R12 : a_40 = r12;
          R13 : a_40 = r13;
          R14 : a_40 = r14;
          R15 : a_40 = r15;
          R16 : a_40 = r16;
          R17 : a_40 = r17;
          R18 : a_40 = r18;
          R19 : a_40 = r19;
          R20 : a_40 = r20;
          R21 : a_40 = r21;
          R22 : a_40 = r22;
          R23 : a_40 = r23;
          R24 : a_40 = r24;
          R25 : a_40 = r25;
          R26 : a_40 = r26;
          R27 : a_40 = r27;
          R28 : a_40 = r28;
          R29 : a_40 = r29;
          R30 : a_40 = r30;
          R31 : a_40 = r31;
        endcase
        case(dest_reg_40)
          R0 : b_40 = r0;
          R1 : b_40 = r1;
          R2 : b_40 = r2;
          R3 : b_40 = r3;
          R4 : b_40 = r4;
          R5 : b_40 = r5;
          R6 : b_40 = r6;
          R7 : b_40 = r7;
          R8 : b_40 = r8;
          R9 : b_40 = r9;
          R10 : b_40 = r10;
          R11 : b_40 = r11;
          R12 : b_40 = r12;
          R13 : b_40 = r13;
          R14 : b_40 = r14;
          R15 : b_40 = r15;
          R16 : b_40 = r16;
          R17 : b_40 = r17;
          R18 : b_40 = r18;
          R19 : b_40 = r19;
          R20 : b_40 = r20;
          R21 : b_40 = r21;
          R22 : b_40 = r22;
          R23 : b_40 = r23;
          R24 : b_40 = r24;
          R25 : b_40 = r25;
          R26 : b_40 = r26;
          R27 : b_40 = r27;
          R28 : b_40 = r28;
          R29 : b_40 = r29;
          R30 : b_40 = r30;
          R31 : b_40 = r31;
        endcase
      end
      BLT:
      begin
        case(src_reg_40)
          R0 : a_40 = r0;
          R1 : a_40 = r1;
          R2 : a_40 = r2;
          R3 : a_40 = r3;
          R4 : a_40 = r4;
          R5 : a_40 = r5;
          R6 : a_40 = r6;
          R7 : a_40 = r7;
          R8 : a_40 = r8;
          R9 : a_40 = r9;
          R10 : a_40 = r10;
          R11 : a_40 = r11;
          R12 : a_40 = r12;
          R13 : a_40 = r13;
          R14 : a_40 = r14;
          R15 : a_40 = r15;
          R16 : a_40 = r16;
          R17 : a_40 = r17;
          R18 : a_40 = r18;
          R19 : a_40 = r19;
          R20 : a_40 = r20;
          R21 : a_40 = r21;
          R22 : a_40 = r22;
          R23 : a_40 = r23;
          R24 : a_40 = r24;
          R25 : a_40 = r25;
          R26 : a_40 = r26;
          R27 : a_40 = r27;
          R28 : a_40 = r28;
          R29 : a_40 = r29;
          R30 : a_40 = r30;
          R31 : a_40 = r31;
        endcase
        case(dest_reg_40)
          R0 : b_40 = r0;
          R1 : b_40 = r1;
          R2 : b_40 = r2;
          R3 : b_40 = r3;
          R4 : b_40 = r4;
          R5 : b_40 = r5;
          R6 : b_40 = r6;
          R7 : b_40 = r7;
          R8 : b_40 = r8;
          R9 : b_40 = r9;
          R10 : b_40 = r10;
          R11 : b_40 = r11;
          R12 : b_40 = r12;
          R13 : b_40 = r13;
          R14 : b_40 = r14;
          R15 : b_40 = r15;
          R16 : b_40 = r16;
          R17 : b_40 = r17;
          R18 : b_40 = r18;
          R19 : b_40 = r19;
          R20 : b_40 = r20;
          R21 : b_40 = r21;
          R22 : b_40 = r22;
          R23 : b_40 = r23;
          R24 : b_40 = r24;
          R25 : b_40 = r25;
          R26 : b_40 = r26;
          R27 : b_40 = r27;
          R28 : b_40 = r28;
          R29 : b_40 = r29;
          R30 : b_40 = r30;
          R31 : b_40 = r31;
        endcase
        sign_ext_40 = IR_40[21] ? {16'hFFFF,IR_40[21:6]} : {16'h0000,IR_40[21:6]};
        NPC_40 = (a_40<b_40) ? (PC_40 - sign_ext_40) : PC_40;
        PC_sel_40 = 1'b1;
      end
      STW:
      begin
        case(src_reg_40)
          R0 : a_40 = r0;
          R1 : a_40 = r1;
          R2 : a_40 = r2;
          R3 : a_40 = r3;
          R4 : a_40 = r4;
          R5 : a_40 = r5;
          R6 : a_40 = r6;
          R7 : a_40 = r7;
          R8 : a_40 = r8;
          R9 : a_40 = r9;
          R10 : a_40 = r10;
          R11 : a_40 = r11;
          R12 : a_40 = r12;
          R13 : a_40 = r13;
          R14 : a_40 = r14;
          R15 : a_40 = r15;
          R16 : a_40 = r16;
          R17 : a_40 = r17;
          R18 : a_40 = r18;
          R19 : a_40 = r19;
          R20 : a_40 = r20;
          R21 : a_40 = r21;
          R22 : a_40 = r22;
          R23 : a_40 = r23;
          R24 : a_40 = r24;
          R25 : a_40 = r25;
          R26 : a_40 = r26;
          R27 : a_40 = r27;
          R28 : a_40 = r28;
          R29 : a_40 = r29;
          R30 : a_40 = r30;
          R31 : a_40 = r31;
        endcase
        case(dest_reg_40)
          R0 : b_40 = r0;
          R1 : b_40 = r1;
          R2 : b_40 = r2;
          R3 : b_40 = r3;
          R4 : b_40 = r4;
          R5 : b_40 = r5;
          R6 : b_40 = r6;
          R7 : b_40 = r7;
          R8 : b_40 = r8;
          R9 : b_40 = r9;
          R10 : b_40 = r10;
          R11 : b_40 = r11;
          R12 : b_40 = r12;
          R13 : b_40 = r13;
          R14 : b_40 = r14;
          R15 : b_40 = r15;
          R16 : b_40 = r16;
          R17 : b_40 = r17;
          R18 : b_40 = r18;
          R19 : b_40 = r19;
          R20 : b_40 = r20;
          R21 : b_40 = r21;
          R22 : b_40 = r22;
          R23 : b_40 = r23;
          R24 : b_40 = r24;
          R25 : b_40 = r25;
          R26 : b_40 = r26;
          R27 : b_40 = r27;
          R28 : b_40 = r28;
          R29 : b_40 = r29;
          R30 : b_40 = r30;
          R31 : b_40 = r31;
        endcase
        sign_ext_40 = IR_40[21] ? {16'hFFFF,IR_40[21:6]} : {16'h0000,IR_40[21:6]};
      end
      BR:
      begin
        sign_ext_40 = IR_40[21] ? {16'hFFFF,IR_40[21:6]} : {16'h0000,IR_40[21:6]};
        NPC_40 = PC_40 - sign_ext_40;
        PC_sel_40 = 1'b1;
      end
      ADDI:
      begin
        case(src_reg_40)
          R0 : a_40 = r0;
          R1 : a_40 = r1;
          R2 : a_40 = r2;
          R3 : a_40 = r3;
          R4 : a_40 = r4;
          R5 : a_40 = r5;
          R6 : a_40 = r6;
          R7 : a_40 = r7;
          R8 : a_40 = r8;
          R9 : a_40 = r9;
          R10 : a_40 = r10;
          R11 : a_40 = r11;
          R12 : a_40 = r12;
          R13 : a_40 = r13;
          R14 : a_40 = r14;
          R15 : a_40 = r15;
          R16 : a_40 = r16;
          R17 : a_40 = r17;
          R18 : a_40 = r18;
          R19 : a_40 = r19;
          R20 : a_40 = r20;
          R21 : a_40 = r21;
          R22 : a_40 = r22;
          R23 : a_40 = r23;
          R24 : a_40 = r24;
          R25 : a_40 = r25;
          R26 : a_40 = r26;
          R27 : a_40 = r27;
          R28 : a_40 = r28;
          R29 : a_40 = r29;
          R30 : a_40 = r30;
          R31 : a_40 = r31;
        endcase
        sign_ext_40 = IR_40[21] ? {16'hFFFF,IR_40[21:6]} : {16'h0000,IR_40[21:6]};
      end
      BEQ :
      begin
        case(src_reg_40)
          R0 : a_40 = r0;
          R1 : a_40 = r1;
          R2 : a_40 = r2;
          R3 : a_40 = r3;
          R4 : a_40 = r4;
          R5 : a_40 = r5;
          R6 : a_40 = r6;
          R7 : a_40 = r7;
          R8 : a_40 = r8;
          R9 : a_40 = r9;
          R10 : a_40 = r10;
          R11 : a_40 = r11;
          R12 : a_40 = r12;
          R13 : a_40 = r13;
          R14 : a_40 = r14;
          R15 : a_40 = r15;
          R16 : a_40 = r16;
          R17 : a_40 = r17;
          R18 : a_40 = r18;
          R19 : a_40 = r19;
          R20 : a_40 = r20;
          R21 : a_40 = r21;
          R22 : a_40 = r22;
          R23 : a_40 = r23;
          R24 : a_40 = r24;
          R25 : a_40 = r25;
          R26 : a_40 = r26;
          R27 : a_40 = r27;
          R28 : a_40 = r28;
          R29 : a_40 = r29;
          R30 : a_40 = r30;
          R31 : a_40 = r31;
        endcase
        case(dest_reg_40)
          R0 : b_40 = r0;
          R1 : b_40 = r1;
          R2 : b_40 = r2;
          R3 : b_40 = r3;
          R4 : b_40 = r4;
          R5 : b_40 = r5;
          R6 : b_40 = r6;
          R7 : b_40 = r7;
          R8 : b_40 = r8;
          R9 : b_40 = r9;
          R10 : b_40 = r10;
          R11 : b_40 = r11;
          R12 : b_40 = r12;
          R13 : b_40 = r13;
          R14 : b_40 = r14;
          R15 : b_40 = r15;
          R16 : b_40 = r16;
          R17 : b_40 = r17;
          R18 : b_40 = r18;
          R19 : b_40 = r19;
          R20 : b_40 = r20;
          R21 : b_40 = r21;
          R22 : b_40 = r22;
          R23 : b_40 = r23;
          R24 : b_40 = r24;
          R25 : b_40 = r25;
          R26 : b_40 = r26;
          R27 : b_40 = r27;
          R28 : b_40 = r28;
          R29 : b_40 = r29;
          R30 : b_40 = r30;
          R31 : b_40 = r31;
        endcase
        sign_ext_40 = IR_40[21] ? {16'hFFFF,IR_40[21:6]} : {16'h0000,IR_40[21:6]};
        NPC_40 = (a_40==b_40) ? (PC_40 - sign_ext_40) : PC_40;
        PC_sel_40 = (a_40==b_40) ? 1'b1 : 1'b0;
      end
      BNE:
      begin
        case(src_reg_40)
          R0 : a_40 = r0;
          R1 : a_40 = r1;
          R2 : a_40 = r2;
          R3 : a_40 = r3;
          R4 : a_40 = r4;
          R5 : a_40 = r5;
          R6 : a_40 = r6;
          R7 : a_40 = r7;
          R8 : a_40 = r8;
          R9 : a_40 = r9;
          R10 : a_40 = r10;
          R11 : a_40 = r11;
          R12 : a_40 = r12;
          R13 : a_40 = r13;
          R14 : a_40 = r14;
          R15 : a_40 = r15;
          R16 : a_40 = r16;
          R17 : a_40 = r17;
          R18 : a_40 = r18;
          R19 : a_40 = r19;
          R20 : a_40 = r20;
          R21 : a_40 = r21;
          R22 : a_40 = r22;
          R23 : a_40 = r23;
          R24 : a_40 = r24;
          R25 : a_40 = r25;
          R26 : a_40 = r26;
          R27 : a_40 = r27;
          R28 : a_40 = r28;
          R29 : a_40 = r29;
          R30 : a_40 = r30;
          R31 : a_40 = r31;
        endcase
        case(dest_reg_40)
          R0 : b_40 = r0;
          R1 : b_40 = r1;
          R2 : b_40 = r2;
          R3 : b_40 = r3;
          R4 : b_40 = r4;
          R5 : b_40 = r5;
          R6 : b_40 = r6;
          R7 : b_40 = r7;
          R8 : b_40 = r8;
          R9 : b_40 = r9;
          R10 : b_40 = r10;
          R11 : b_40 = r11;
          R12 : b_40 = r12;
          R13 : b_40 = r13;
          R14 : b_40 = r14;
          R15 : b_40 = r15;
          R16 : b_40 = r16;
          R17 : b_40 = r17;
          R18 : b_40 = r18;
          R19 : b_40 = r19;
          R20 : b_40 = r20;
          R21 : b_40 = r21;
          R22 : b_40 = r22;
          R23 : b_40 = r23;
          R24 : b_40 = r24;
          R25 : b_40 = r25;
          R26 : b_40 = r26;
          R27 : b_40 = r27;
          R28 : b_40 = r28;
          R29 : b_40 = r29;
          R30 : b_40 = r30;
          R31 : b_40 = r31;
        endcase
        sign_ext_40 = IR_40[21] ? {16'hFFFF,IR_40[21:6]} : {16'h0000,IR_40[21:6]};
        NPC_40 = (a_40!=b_40) ? (PC_40 - sign_ext_40) : PC_40;
        PC_sel_40 = (a_40!=b_40) ? 1'b1 : 1'b0;
      end
      JMP:
      begin
        case(j)
        6'b001101:
        begin
          $display("vvvv");
          case(src_reg_40)
            R0 : NPC_40 = r0;
            R1 : NPC_40 = r1;
            R2 : NPC_40 = r2;
            R3 : NPC_40 = r3;
            R4 : NPC_40 = r4;
            R5 : NPC_40 = r5;
            R6 : NPC_40 = r6;
            R7 : NPC_40 = r7;
            R8 : NPC_40 = r8;
            R9 : NPC_40 = r9;
            R10 : NPC_40 = r10;
            R11 : NPC_40 = r11;
            R12 : NPC_40 = r12;
            R13 : NPC_40 = r13;
            R14 : NPC_40 = r14;
            R15 : NPC_40 = r15;
            R16 : NPC_40 = r16;
            R17 : NPC_40 = r17;
            R18 : NPC_40 = r18;
            R19 : NPC_40 = r19;
            R20 : NPC_40 = r20;
            R21 : NPC_40 = r21;
            R22 : NPC_40 = r22;
            R23 : NPC_40 = r23;
            R24 : NPC_40 = r24;
            R25 : NPC_40 = r25;
            R26 : NPC_40 = r26;
            R27 : NPC_40 = r27;
            R28 : NPC_40 = r28;
            R29 : NPC_40 = r29;
            R30 : NPC_40 = r30;
            R31 : NPC_40 = r31;
          endcase
        end
        endcase
        PC_sel_40 = 1'b1;
      end
      CALL:
      begin
        b_40 = PC_40 + 4;
        NPC_40 = {PC_40[31:28],IR_40[31:7],2'b00};
        PC_sel_40 = 1'b1;
      end
      SUBI:
      begin
        case(src_reg_40)
          R0 : a_40 = r0;
          R1 : a_40 = r1;
          R2 : a_40 = r2;
          R3 : a_40 = r3;
          R4 : a_40 = r4;
          R5 : a_40 = r5;
          R6 : a_40 = r6;
          R7 : a_40 = r7;
          R8 : a_40 = r8;
          R9 : a_40 = r9;
          R10 : a_40 = r10;
          R11 : a_40 = r11;
          R12 : a_40 = r12;
          R13 : a_40 = r13;
          R14 : a_40 = r14;
          R15 : a_40 = r15;
          R16 : a_40 = r16;
          R17 : a_40 = r17;
          R18 : a_40 = r18;
          R19 : a_40 = r19;
          R20 : a_40 = r20;
          R21 : a_40 = r21;
          R22 : a_40 = r22;
          R23 : a_40 = r23;
          R24 : a_40 = r24;
          R25 : a_40 = r25;
          R26 : a_40 = r26;
          R27 : a_40 = r27;
          R28 : a_40 = r28;
          R29 : a_40 = r29;
          R30 : a_40 = r30;
          R31 : a_40 = r31;
        endcase
        sign_ext_40 = IR_40[21] ? {16'hFFFF,IR_40[21:6]} : {16'h0000,IR_40[21:6]};
      end
      NOPE:
      begin
      end
    endcase
  
  end
  end

endmodule
