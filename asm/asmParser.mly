%{
  open AsmSyntax
%}

%token <int> DECINT HEXINT
%token <string> LABEL
%token LDA LDAH LDL STL BEQ BNE BR BSR JMP JSR RET ADDL SUBL CMPEQ CMPLE CMPLT
AND BIS XOR SLL SRL SRA LDS STS FBEQ FBNE CMPSEQ CMPSLE CMPSLT ADDS SUBS MULS
INVS SQRTS CVTSL_C CVTLS FTOIS ITOFS 
%token COMMA COLON DOLLAR DOLLAR_F LPAREN RPAREN
%token EOL
%token EOF


%start insts
%type <AsmSyntax.inst list> insts

%%

insts:
| eol0 inst1 {$2}
;

inst1:
| inst eol0 inst1 {$1::$3}
| EOF {[]}
;

inst:
| labels mn args EOL {($1,$2,$3)}
;

labels:
| LABEL eol1 labels {$1::$3}
| LABEL {[$1]}
| {[]}
;

mn:
| LDA {M_LDA}
| LDAH {M_LDAH}
| LDL {M_LDL}
| STL {M_STL}
| BEQ {M_BEQ}
| BNE {M_BNE}
| BR {M_BR}
| BSR {M_BSR}
| JMP {M_JMP}
| JSR {M_JSR}
| RET {M_RET}
| ADDL {M_ADDL}
| SUBL {M_SUBL}
| CMPEQ {M_CMPEQ}
| CMPLE {M_CMPLE}
| CMPLT {M_CMPLT}
| AND {M_AND}
| BIS {M_BIS}
| XOR {M_XOR}
| SLL {M_SLL}
| SRL {M_SRL}
| SRA {M_SRA}
| LDS {M_LDS}
| STS {M_STS}
| FBEQ {M_FBEQ}
| FBNE {M_FBNE}
| CMPSEQ {M_CMPSEQ}
| CMPSLE {M_CMPSLE}
| CMPSLT {M_CMPSLT}
| ADDS {M_ADDS}
| SUBS {M_SUBS}
| MULS {M_MULS}
| CVTSL_C {M_CVTSL_C}
| CVTLS {M_CVTLS}
| FTOIS {M_FTOIS}
| ITOFS {M_ITOFS}
;

args:
| args1 {$1}
| {[]}
;

args1:
| arg {[$1]}
| arg COMMA args1 {$1::$3}
;

arg:
| DOLLAR DECINT {A_R $2}
| DOLLAR_F DECINT {A_F $2}
| LPAREN DOLLAR DECINT RPAREN {A_Rm $3}
| DECINT LPAREN DOLLAR DECINT RPAREN {A_Disp ($4, I_Dec $1)}
| HEXINT LPAREN DOLLAR DECINT RPAREN {A_Disp ($4, I_Hex $1)}
| DECINT {A_Immd (I_Dec $1)}
| HEXINT {A_Immd (I_Hex $1)}
| LABEL {A_Label $1}
;

eol0:
| {}
| eol1 {}
;

eol1:
| EOL eol0 {}
;
