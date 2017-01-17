`timescale 1ns/10ps
`include "mem_code.v"
`include "ins_mem_40.v"
`include "combine_proce.v"

module proc_tb();

reg clk_40,rst_40;
wire [31:0] mrd_d_40,mrd_i_40;
wire [31:0] mwd_d_40,mwd_i_40;
wire [31:0] mwa_d_40,mwa_i_40;
wire [31:0] mra_d_40,mra_i_40;
wire        mwr_d_40,mwr_i_40;

//proc DUT(clk,rst,mrd_i,mwd_i,mra_i,mwa_i,mwr_i,mrd_d,mwd_d,mra_d,mwa_d,mwr_d);

proc DUT(clk_40,rst_40,mrd_i_40,mwd_i_40,mra_i_40,mwa_i_40,mwr_i_40,mrd_d_40,mwd_d_40,mra_d_40,mwa_d_40,mwr_d_40);

ins_mem_40 m0(.clk_40(clk_40),.waddr_40(mwa_i_40),.wdata_40(mwd_i_40),.write_40(mwr_i_40),.raddr_40(mra_i_40),.rdata_40(mrd_i_40));

data_mem_40 m1(.clk_40(clk_40),.waddr_40(mwa_d_40),.wdata_40(mwd_d_40),.write_40(mwr_d_40),.raddr_40(mra_d_40),.rdata_40(mrd_d_40));


initial 
begin
  clk_40 = 1'b0;
  forever #5 clk_40 = ~clk_40;
end

initial
begin
  #2 rst_40 = 1'b1;
  #5 rst_40 = 1'b0;
end
 
initial
begin
  $dumpfile ("proc.vcd");
  $dumpvars (0,proc_tb);
  #2500 $finish();
end
endmodule

