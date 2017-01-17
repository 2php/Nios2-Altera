`timescale 1ns/10ps
`include "fetch.v"
`include "decode.v"
`include "execute.v"
`include "mw.v"
`include "wb.v"

module proc(clk_40,rst_40,mrd_i_40,mwd_i_40,mra_i_40,mwa_i_40,mwr_i_40,mrd_d_40,mwd_d_40,mra_d_40,mwa_d_40,mwr_d_40);

input clk_40,rst_40;
input [31:0] mrd_i_40,mrd_d_40;            //// memory read data
output [31:0] mwd_i_40,mwd_d_40;            //// memory write data    
output [31:0] mra_i_40,mra_d_40;            //// memory read address
output [31:0] mwa_i_40,mwa_d_40;            //// memory write address
output mwr_i_40,mwr_d_40;                  //// memory write enable

wire [31:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
wire [31:0] r10,r11,r12,r13,r14,r15,r16,r17,r18,r19;
wire [31:0] r20,r21,r22,r23,r24,r25,r26,r27,r28,r29;
wire [31:0] r30,r31;

wire [31:0] PC_in_fd_40;
wire [31:0] NPC_fd_40;
wire [31:0] IR_fd_40;
wire        PC_sel_fd_40;

wire [31:0] sign_ext_de_40;
wire [5:0]  opcode_de_40;
wire [5:0]  src_reg_de_40;
wire [5:0]  dest_reg_de_40;
wire [5:0]  targ_reg_de_40;
wire [31:0] a_de_40;
wire [31:0] b_de_40;

wire [31:0] alu_out_em_40;
wire [31:0] alu_src_em_40;
wire [5:0]  opcode_out_em_40;
wire [5:0]  src_reg_out_em_40;
wire [5:0]  dest_reg_out_em_40;
wire [5:0]  targ_reg_out_em_40;

wire [31:0] mem_out1_mr_40;
wire [31:0] mem_out2_mr_40;
wire [5:0]  opcode_out_mr_40;
wire [5:0]  src_reg_out_mr_40;
wire [5:0]  dest_reg_out_mr_40;
wire [5:0]  targ_reg_out_mr_40;

reg [31:0] NPC_fd_f_40;
reg PC_sel_fd_f_40;
reg PC_in_fd_f_40;
reg [31:0] IR_fd_f_40;

reg [31:0] a_de_f_40;
reg [31:0] b_de_f_40;

reg [31:0] sign_ext_de_f_40,a_de_f_40,b_de_f_40;
reg [5:0]  opcode_de_f_40,src_reg_de_f_40,dest_reg_de_f_40,targ_reg_de_f_40;

reg [31:0] alu_out_em_f_40,alu_src_em_f_40;
reg [5:0]  opcode_out_em_f_40,src_reg_out_em_f_40,dest_reg_out_em_f_40,targ_reg_out_em_f_40;

reg [31:0] mem_out1_mr_f_40,mem_out2_mr_f_40,mem_out1_mr_ff_40;
reg [5:0]  opcode_out_mr_f_40,src_reg_out_mr_f_40,dest_reg_out_mr_f_40,targ_reg_out_mr_f_40;

reg [31:0] a_de_m_40,b_de_m_40;
wire [31:0] alu_out_em_m_40,alu_src_em_m_40;


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


initial
begin
  a_de_m_40 = 0;
  b_de_m_40 = 0;
end
always @(posedge clk_40 or posedge rst_40)
begin
  if(rst_40)
  begin
    NPC_fd_f_40 <= 0;
    PC_sel_fd_f_40 <= 0;
    PC_in_fd_f_40 <= 0;
    IR_fd_f_40 <= 0;

    sign_ext_de_f_40 <= 0; 
    opcode_de_f_40   <= 0; 
    src_reg_de_f_40  <= 0; 
    dest_reg_de_f_40 <= 0; 
    targ_reg_de_f_40 <= 0; 
    a_de_f_40        <= 0; 
    b_de_f_40        <= 0; 

    alu_out_em_f_40      <= 0; 
    alu_src_em_f_40      <= 0; 
    opcode_out_em_f_40   <= 0; 
    src_reg_out_em_f_40  <= 0; 
    dest_reg_out_em_f_40 <= 0; 
    targ_reg_out_em_f_40 <= 0; 

    mem_out1_mr_f_40     <= 0; 
    mem_out2_mr_f_40     <= 0; 
    opcode_out_mr_f_40   <= 0; 
    src_reg_out_mr_f_40  <= 0; 
    dest_reg_out_mr_f_40 <= 0; 
    targ_reg_out_mr_f_40 <= 0; 


    mem_out1_mr_ff_40    <= 0; 
  end
  else
  begin
    NPC_fd_f_40 <= NPC_fd_40;
    PC_sel_fd_f_40 <= PC_sel_fd_40;
    PC_in_fd_f_40 <= PC_in_fd_40;
    IR_fd_f_40 <= IR_fd_40;

    sign_ext_de_f_40 <= sign_ext_de_40;
    opcode_de_f_40   <= opcode_de_40;
    src_reg_de_f_40  <= src_reg_de_40;
    dest_reg_de_f_40 <= dest_reg_de_40;
    targ_reg_de_f_40 <= targ_reg_de_40;
    a_de_f_40        <= a_de_40;
    b_de_f_40        <= b_de_40;

    alu_out_em_f_40      <= alu_out_em_40;
    alu_src_em_f_40      <= alu_src_em_40;
    opcode_out_em_f_40   <= opcode_out_em_40;
    src_reg_out_em_f_40  <= src_reg_out_em_40;
    dest_reg_out_em_f_40 <= dest_reg_out_em_40;
    targ_reg_out_em_f_40 <= targ_reg_out_em_40;

    mem_out1_mr_f_40     <=  mem_out1_mr_40;
    mem_out2_mr_f_40     <=  mem_out2_mr_40;
    opcode_out_mr_f_40   <=  opcode_out_mr_40;
    src_reg_out_mr_f_40  <=  src_reg_out_mr_40;
    dest_reg_out_mr_f_40 <=  dest_reg_out_mr_40;
    targ_reg_out_mr_f_40 <=  targ_reg_out_mr_40;

 
    mem_out1_mr_ff_40     <=  mem_out1_mr_f_40;
  end 
end

fetch f(.clk_40(clk_40),.rst_40(rst_40),.mra_i_40(mra_i_40),.mrd_i_40(mrd_i_40),.PC_in_40(PC_in_fd_40),.NPC_40(NPC_fd_40),.IR_40(IR_fd_40),.PC_sel_40(PC_sel_fd_40));

decode d(.clk_40(clk_40),.rst_40(rst_40),.IR_40(IR_fd_f_40),.PC_40(NPC_fd_f_40),.a_40(a_de_40),.b_40(b_de_40),.NPC_40(PC_in_fd_40),.PC_sel_40(PC_sel_fd_40),.sign_ext_40(sign_ext_de_40),.opcode_40(opcode_de_40),.src_reg_40(src_reg_de_40),.dest_reg_40(dest_reg_de_40),.targ_reg_40(targ_reg_de_40),.r0(r0),.r1(r1),.r2(r2),.r3(r3),.r4(r4),.r5(r5),.r6(r6),.r7(r7),.r8(r8),.r9(r9),.r10(r10),.r11(r11),.r12(r12),.r13(r13),.r14(r14),.r15(r15),.r16(r16),.r17(r17),.r18(r18),.r19(r19), .r20(r20),.r21(r21),.r22(r22),.r23(r23),.r24(r24),.r25(r25),.r26(r26),.r27(r27),.r28(r28),.r29(r29),.r30(r30),.r31(r31));

execute e(.clk_40(clk_40),.rst_40(rst_40),.opcode_40(opcode_de_f_40),.a_40(a_de_m_40),.b_40(b_de_m_40),.sign_ext_40(sign_ext_de_f_40),.alu_out_40(alu_out_em_40),.alu_src_40(alu_src_em_40),.opcode_out_40(opcode_out_em_40),.src_reg_40(src_reg_de_f_40),.dest_reg_40(dest_reg_de_f_40),.targ_reg_40(targ_reg_de_f_40),.src_reg_out_40(src_reg_out_em_40),.dest_reg_out_40(dest_reg_out_em_40),.targ_reg_out_40(targ_reg_out_em_40));

memory_write m(.clk_40(clk_40),.rst_40(rst_40),.opcode_40(opcode_out_em_f_40),.src_reg_40(src_reg_out_em_f_40),.dest_reg_40(dest_reg_out_em_f_40),.targ_reg_40(targ_reg_out_em_f_40),.alu_out_40(alu_out_em_f_40),.alu_src_40(alu_src_em_f_40),.mem_out1_40(mem_out1_mr_40),.mem_out2_40(mem_out2_mr_40),.opcode_out_40(opcode_out_mr_40),.src_reg_out_40(src_reg_out_mr_40),.dest_reg_out_40(dest_reg_out_mr_40),.targ_reg_out_40(targ_reg_out_mr_40),.mwr_d_40(mwr_d_40),.mwd_d_40(mwd_d_40),.mwa_d_40(mwa_d_40),.mra_d_40(mra_d_40),.mrd_d_40(mrd_d_40),.r0(r0),.r1(r1),.r2(r2),.r3(r3),.r4(r4),.r5(r5),.r6(r6),.r7(r7),.r8(r8),.r9(r9),.r10(r10),.r11(r11),.r12(r12),.r13(r13),.r14(r14),.r15(r15),.r16(r16),.r17(r17),.r18(r18),.r19(r19), .r20(r20),.r21(r21),.r22(r22),.r23(r23),.r24(r24),.r25(r25),.r26(r26),.r27(r27),.r28(r28),.r29(r29),.r30(r30),.r31(r31));

rw r(.clk_40(clk_40),.rst_40(rst_40),.opcode_40(opcode_out_mr_f_40),.src_reg_40(src_reg_out_mr_f_40),.dest_reg_40(dest_reg_out_mr_f_40),.targ_reg_40(targ_reg_out_mr_f_40),.mem_out1_40(mem_out1_mr_f_40),.mem_out2_40(mem_out2_mr_f_40),.r0(r0),.r1(r1),.r2(r2),.r3(r3),.r4(r4),.r5(r5),.r6(r6),.r7(r7),.r8(r8),.r9(r9),.r10(r10),.r11(r11),.r12(r12),.r13(r13),.r14(r14),.r15(r15),.r16(r16),.r17(r17),.r18(r18),.r19(r19), .r20(r20),.r21(r21),.r22(r22),.r23(r23),.r24(r24),.r25(r25),.r26(r26),.r27(r27),.r28(r28),.r29(r29),.r30(r30),.r31(r31));

always @(*)
begin
  a_de_m_40 = a_de_f_40;
  b_de_m_40 = b_de_f_40;
  
  case(opcode_out_em_f_40)
    CALL:
    begin
      case(opcode_de_f_40)
        ADD:
        begin
          a_de_m_40 = (targ_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
          b_de_m_40 = (targ_reg_out_em_f_40 == dest_reg_de_f_40) ? alu_out_em_f_40 : b_de_f_40;
        end
        MUL:
        begin
          a_de_m_40 = (targ_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
          b_de_m_40 = (targ_reg_out_em_f_40 == dest_reg_de_f_40) ? alu_out_em_f_40 : b_de_f_40;
        end
        ADDI:
        begin
          a_de_m_40 = (targ_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
        end
        SUBI:
        begin
          a_de_m_40 = (targ_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
        end
        LDW:
        begin
          a_de_m_40 = (targ_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
        end
        STW:
        begin
          a_de_m_40 = (targ_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
          b_de_m_40 = (targ_reg_out_em_f_40 == dest_reg_de_f_40) ? alu_out_em_f_40 : b_de_f_40;
        end
        BNE:
        begin
          a_de_m_40 = (targ_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
          b_de_m_40 = (targ_reg_out_em_f_40 == dest_reg_de_f_40) ? alu_out_em_f_40 : b_de_f_40;
        end
      endcase
    end
    ADD:
    begin
      case(opcode_de_f_40)
        ADD:
        begin
          a_de_m_40 = (targ_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
          b_de_m_40 = (targ_reg_out_em_f_40 == dest_reg_de_f_40) ? alu_out_em_f_40 : b_de_f_40;
        end
        MUL:
        begin
          a_de_m_40 = (targ_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
          b_de_m_40 = (targ_reg_out_em_f_40 == dest_reg_de_f_40) ? alu_out_em_f_40 : b_de_f_40;
        end
        ADDI:
        begin
          a_de_m_40 = (targ_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
        end
        SUBI:
        begin
          a_de_m_40 = (targ_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
        end
        LDW:
        begin
          a_de_m_40 = (targ_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
        end
        STW:
        begin
          a_de_m_40 = (targ_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
          b_de_m_40 = (targ_reg_out_em_f_40 == dest_reg_de_f_40) ? alu_out_em_f_40 : b_de_f_40;
        end
        BNE:
        begin
          a_de_m_40 = (targ_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
          b_de_m_40 = (targ_reg_out_em_f_40 == dest_reg_de_f_40) ? alu_out_em_f_40 : b_de_f_40;
        end
      endcase
    end
    MUL:
    begin
      case(opcode_de_f_40)
        ADD:
        begin
          a_de_m_40 = (targ_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
          b_de_m_40 = (targ_reg_out_em_f_40 == dest_reg_de_f_40) ? alu_out_em_f_40 : b_de_f_40;
        end
        MUL:
        begin
          a_de_m_40 = (targ_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
          b_de_m_40 = (targ_reg_out_em_f_40 == dest_reg_de_f_40) ? alu_out_em_f_40 : b_de_f_40;
        end
        ADDI:
        begin
          a_de_m_40 = (targ_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
        end
        SUBI:
        begin
          a_de_m_40 = (targ_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
        end
        LDW:
        begin
          a_de_m_40 = (targ_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
        end
        STW:
        begin
          a_de_m_40 = (targ_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
          b_de_m_40 = (targ_reg_out_em_f_40 == dest_reg_de_f_40) ? alu_out_em_f_40 : b_de_f_40;
        end
        BNE:
        begin
          a_de_m_40 = (targ_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
          b_de_m_40 = (targ_reg_out_em_f_40 == dest_reg_de_f_40) ? alu_out_em_f_40 : b_de_f_40;
        end
      endcase
    end
    ADDI:
    begin
      case(opcode_de_f_40)
        ADD:
        begin
          a_de_m_40 = (dest_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
          b_de_m_40 = (dest_reg_out_em_f_40 == dest_reg_de_f_40) ? alu_out_em_f_40 : b_de_f_40;
        end
        MUL:
        begin
          a_de_m_40 = (dest_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
          b_de_m_40 = (dest_reg_out_em_f_40 == dest_reg_de_f_40) ? alu_out_em_f_40 : b_de_f_40;
        end
        ADDI:
        begin
          a_de_m_40 = (dest_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
        end
        SUBI:
        begin
          a_de_m_40 = (dest_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
        end
        LDW:
        begin
          a_de_m_40 = (dest_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
        end
        STW:
        begin
          a_de_m_40 = (dest_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
          b_de_m_40 = (dest_reg_out_em_f_40 == dest_reg_de_f_40) ? alu_out_em_f_40 : b_de_f_40;
        end
        BNE:
        begin
          a_de_m_40 = (targ_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
          b_de_m_40 = (targ_reg_out_em_f_40 == dest_reg_de_f_40) ? alu_out_em_f_40 : b_de_f_40;
        end
      endcase
    end
    SUBI:
    begin
      case(opcode_de_f_40)
        ADD:
        begin
          a_de_m_40 = (dest_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
          b_de_m_40 = (dest_reg_out_em_f_40 == dest_reg_de_f_40) ? alu_out_em_f_40 : b_de_f_40;
        end
        MUL:
        begin
          a_de_m_40 = (dest_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
          b_de_m_40 = (dest_reg_out_em_f_40 == dest_reg_de_f_40) ? alu_out_em_f_40 : b_de_f_40;
        end
        ADDI:
        begin
          a_de_m_40 = (dest_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
        end
        SUBI:
        begin
          a_de_m_40 = (dest_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
        end
        LDW:
        begin
          a_de_m_40 = (dest_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
        end
        STW:
        begin
          a_de_m_40 = (dest_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
          b_de_m_40 = (dest_reg_out_em_f_40 == dest_reg_de_f_40) ? alu_out_em_f_40 : b_de_f_40;
        end
        BNE:
        begin
          a_de_m_40 = (targ_reg_out_em_f_40 == src_reg_de_f_40 ) ? alu_out_em_f_40 : a_de_f_40;
          b_de_m_40 = (targ_reg_out_em_f_40 == dest_reg_de_f_40) ? alu_out_em_f_40 : b_de_f_40;
        end
      endcase
    end
    LDW:
    begin
    end
  endcase

  case(opcode_out_mr_f_40)
    ADD:
    begin
      case(opcode_de_f_40)
        ADD:
        begin
          a_de_m_40 = (targ_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
          b_de_m_40 = (targ_reg_out_mr_f_40 == dest_reg_de_f_40) ? mem_out1_mr_f_40 : b_de_m_40;
        end
        MUL:
        begin
          a_de_m_40 = (targ_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
          b_de_m_40 = (targ_reg_out_mr_f_40 == dest_reg_de_f_40) ? mem_out1_mr_f_40 : b_de_m_40;
        end
        ADDI:
        begin
          a_de_m_40 = (targ_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
        end
        SUBI:
        begin
          a_de_m_40 = (targ_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
        end
        LDW:
        begin
          a_de_m_40 = (targ_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
        end
        STW:
        begin
          a_de_m_40 = (targ_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
          b_de_m_40 = (targ_reg_out_mr_f_40 == dest_reg_de_f_40) ? mem_out1_mr_f_40 : b_de_m_40;
        end
        BNE:
        begin
          a_de_m_40 = (targ_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
          b_de_m_40 = (targ_reg_out_mr_f_40 == dest_reg_de_f_40) ? mem_out1_mr_f_40 : b_de_m_40;
        end
      endcase
    end
    MUL:
    begin
      case(opcode_de_f_40)
        ADD:
        begin
          a_de_m_40 = (targ_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
          b_de_m_40 = (targ_reg_out_mr_f_40 == dest_reg_de_f_40) ? mem_out1_mr_f_40 : b_de_m_40;
        end
        MUL:
        begin
          a_de_m_40 = (targ_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
          b_de_m_40 = (targ_reg_out_mr_f_40 == dest_reg_de_f_40) ? mem_out1_mr_f_40 : b_de_m_40;
        end
        ADDI:
        begin
          a_de_m_40 = (targ_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
        end
        SUBI:
        begin
          a_de_m_40 = (targ_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
        end
        LDW:
        begin
          a_de_m_40 = (targ_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
        end
        STW:
        begin
          a_de_m_40 = (targ_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
          b_de_m_40 = (targ_reg_out_mr_f_40 == dest_reg_de_f_40) ? mem_out1_mr_f_40 : b_de_m_40;
        end
        BNE:
        begin
          a_de_m_40 = (targ_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
          b_de_m_40 = (targ_reg_out_mr_f_40 == dest_reg_de_f_40) ? mem_out1_mr_f_40 : b_de_m_40;
        end
      endcase
    end
    ADDI:
    begin
      case(opcode_de_f_40)
        ADD:
        begin
          a_de_m_40 = (dest_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
          b_de_m_40 = (dest_reg_out_mr_f_40 == dest_reg_de_f_40) ? mem_out1_mr_f_40 : b_de_m_40;
        end
        MUL:
        begin
          a_de_m_40 = (dest_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
          b_de_m_40 = (dest_reg_out_mr_f_40 == dest_reg_de_f_40) ? mem_out1_mr_f_40 : b_de_m_40;
        end
        ADDI:
        begin
          a_de_m_40 = (dest_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
        end
        SUBI:
        begin
          a_de_m_40 = (dest_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
        end
        LDW:
        begin
          a_de_m_40 = (dest_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
        end
        STW:
        begin
          a_de_m_40 = (dest_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
          b_de_m_40 = (dest_reg_out_mr_f_40 == dest_reg_de_f_40) ? mem_out1_mr_f_40 : b_de_m_40;
        end
        BNE:
        begin
          a_de_m_40 = (targ_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
          b_de_m_40 = (targ_reg_out_mr_f_40 == dest_reg_de_f_40) ? mem_out1_mr_f_40 : b_de_m_40;
        end
      endcase
    end
    SUBI:
    begin
      case(opcode_de_f_40)
        ADD:
        begin
          a_de_m_40 = (dest_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
          b_de_m_40 = (dest_reg_out_mr_f_40 == dest_reg_de_f_40) ? mem_out1_mr_f_40 : b_de_m_40;
        end
        MUL:
        begin
          a_de_m_40 = (dest_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
          b_de_m_40 = (dest_reg_out_mr_f_40 == dest_reg_de_f_40) ? mem_out1_mr_f_40 : b_de_m_40;
        end
        ADDI:
        begin
          a_de_m_40 = (dest_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
        end
        SUBI:
        begin
          a_de_m_40 = (dest_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
        end
        LDW:
        begin
          a_de_m_40 = (dest_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
        end
        STW:
        begin
          a_de_m_40 = (dest_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
          b_de_m_40 = (dest_reg_out_mr_f_40 == dest_reg_de_f_40) ? mem_out1_mr_f_40 : b_de_m_40;
        end
        BNE:
        begin
          a_de_m_40 = (targ_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
          b_de_m_40 = (targ_reg_out_mr_f_40 == dest_reg_de_f_40) ? mem_out1_mr_f_40 : b_de_m_40;
        end
      endcase
    end
    LDW:
    begin
      case(opcode_de_f_40)
        ADD:
        begin
          a_de_m_40 = (dest_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
          b_de_m_40 = (dest_reg_out_mr_f_40 == dest_reg_de_f_40) ? mem_out1_mr_f_40 : b_de_m_40;
        end
        MUL:
        begin
          a_de_m_40 = (dest_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
          b_de_m_40 = (dest_reg_out_mr_f_40 == dest_reg_de_f_40) ? mem_out1_mr_f_40 : b_de_m_40;
        end
        ADDI:
        begin
          a_de_m_40 = (dest_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
        end
        SUBI:
        begin
          a_de_m_40 = (dest_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
        end
        LDW:
        begin
          a_de_m_40 = (dest_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
        end
        STW:
        begin
          a_de_m_40 = (dest_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
          b_de_m_40 = (dest_reg_out_mr_f_40 == dest_reg_de_f_40) ? mem_out1_mr_f_40 : b_de_m_40;
        end
        BNE:
        begin
          a_de_m_40 = (targ_reg_out_mr_f_40 == src_reg_de_f_40 ) ? mem_out1_mr_f_40 : a_de_m_40;
          b_de_m_40 = (targ_reg_out_mr_f_40 == dest_reg_de_f_40) ? mem_out1_mr_f_40 : b_de_m_40;
        end
      endcase
    end
  endcase
end

endmodule


