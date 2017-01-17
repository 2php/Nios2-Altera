# Nios2-Altera
Nios II Processor-Altera

This is Verilog code for 32-bit MIPS Nios-|| Architecture. It has six different section in design, each stage of 5- stage pipeline structure was designed in different files and executed together.
In MIPS there are 5 stages:
 Fetch Stage
 Decode Stage
 Execution Stage
 Memory write stage
 Write back Stage

This stages are designed in below given code.

fetch.v-->      Fetch Stage
decode.v-->     Decode Stage
execute.v-->    Execution Stage
mw.v-->         Memory write stage
wb.v -->        Write back Stage
mem_code.v-->   Code Memory (In which memory data memory is created)
ins_mem_40 -->  Instruction Memory(In thich Instruction memory is created)
combine_proce.v-> Combining all the blocks together
combine_proce_tb.v-> Test Bench for the whole code

Advantages__
Mips provide 5 stage pipeline structure which is very fast in execution and provides instruction level parallelism. Using Nios:2 soft core architecture which has different instruction format than Mips assembly this project has been implemented. Hence, MIPS hardware can be used for different types of different instruction formats with slight modifications.
