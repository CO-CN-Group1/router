`define EXE_NOP         6'b000000

//31:26

`define EXE_ORI         6'b001101
`define EXE_ANDI        6'b001100
`define EXE_XORI        6'b001110
`define EXE_LUI         6'b001111
`define EXE_PREF        6'b110011
`define EXE_SPECIAL     6'b000000


//special inst 31:26 = 000000
//5:0

`define EXE_AND         6'b100100
`define EXE_OR          6'b100101
`define EXE_XOR         6'b100110
`define EXE_NOR         6'b100111
`define EXE_SLL         6'b000000
`define EXE_SLLV        6'b000100
`define EXE_SRL         6'b000010
`define EXE_SRLV        6'b000110
`define EXE_SRA         6'b000011
`define EXE_SRAV        6'b000111
`define EXE_SYNC        6'b001111
`define EXE_MOVN        6'b001011
`define EXE_MOVZ        6'b001010
`define EXE_MFHI        6'b010000
`define EXE_MTHI        6'b010001
`define EXE_MFLO        6'b010010
`define EXE_MTLO        6'b010011



`define EXE_AND_OP      8'b00100100
`define EXE_OR_OP       8'b00100101
`define EXE_XOR_OP      8'b00100110
`define EXE_NOR_OP      8'b00100111 

`define EXE_SLL_OP      8'b01111100
`define EXE_SRL_OP      8'b00000010
`define EXE_SRA_OP      8'b00000011

`define EXE_NOP_OP      8'b00000000

`define EXE_MOVZ_OP     8'b00001010
`define EXE_MOVN_OP     8'b00001011
`define EXE_MFHI_OP     8'b00010000
`define EXE_MTHI_OP     8'b00010001
`define EXE_MFLO_OP     8'b00010010
`define EXE_MTLO_OP     8'b00010011


//AluSel
`define EXE_RES_LOGIC   3'b001
`define EXE_RES_SHIFT   3'b010
`define EXE_RES_NOP     3'b000
`define EXE_RES_MOVE    3'b011