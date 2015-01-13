type immd =
| I_Dec of int
| I_Hex of int

type arg =
| A_Immd of immd
| A_R of int
| A_Rm of int
| A_F of int
| A_Disp of int * immd
| A_Label of string

type mnemonic =
| M_LDA
| M_LDAH
| M_LDL
| M_STL
| M_BEQ
| M_BNE
| M_BR
| M_BSR
| M_JMP
| M_JSR
| M_RET
| M_ADDL
| M_SUBL
| M_CMPEQ
| M_CMPLE
| M_CMPLT
| M_AND
| M_BIS
| M_XOR
| M_EQV
| M_SLL
| M_SRL
| M_SRA
| M_LDS
| M_STS
| M_FBEQ
| M_FBNE
| M_CMPSEQ
| M_CMPSLE
| M_CMPSLT
| M_ADDS
| M_SUBS
| M_MULS
| M_INVS
| M_SQRTS
| M_CVTSL_C
| M_CVTLS
| M_FTOIS
| M_ITOFS
| M_MOV
| M_NOP
| M_HALT

type inst = string list * mnemonic * arg list
