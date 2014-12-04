{
  open AsmSyntax
  open AsmParser
  open String
  let suffix s n =
    sub s n (length s - n)
  let kw_list = [
    ("LDA", LDA);
    ("LDAH", LDAH);
    ("LDL", LDL);
    ("STL", STL);
    ("BEQ", BEQ);
    ("BNE", BNE);
    ("BR", BR);
    ("BSR", BSR);
    ("JMP", JMP);
    ("JSR", JSR);
    ("RET", RET);
    ("ADDL", ADDL);
    ("SUBL", SUBL);
    ("CMPEQ", CMPEQ);
    ("CMPLE", CMPLE);
    ("CMPLT", CMPLT);
    ("AND", AND);
    ("BIS", BIS);
    ("XOR", XOR);
    ("SLL", SLL);
    ("SRL", SRL);
    ("SRA", SRA);
    ("LDS", LDS);
    ("STS", STS);
    ("FBEQ", FBEQ);
    ("FBNE", FBNE);
    ("CMPSEQ", CMPSEQ);
    ("CMPSLE", CMPSLE);
    ("CMPSLT", CMPSLT);
    ("ADDS", ADDS);
    ("SUBS", SUBS);
    ("MULS", MULS);
    ("INVS", INVS);
    ("SQRTS", SQRTS);
    ("CVTSL/C", CVTSL_C);
    ("CVTLS", CVTLS);
    ("FTOIS", FTOIS);
    ("ITOFS", ITOFS)]
  let kw_tbl = Hashtbl.create (List.length kw_list)
  let _ =
    List.iter (fun (k, t) -> Hashtbl.add kw_tbl k t) kw_list
}

let space = ' ' | '\t'
let digit = ['0'-'9']
let hdigit = ['0'-'9' 'A'-'F' 'a'-'f']
let num = ('+'|'-')?digit+
let hnum = "0x"hdigit+
let alpha = ['a'-'z' 'A'-'Z' '_' '.']
let ident = alpha (alpha | digit)*

rule token = parse
  | space+ {token lexbuf}
  | ',' {COMMA}
  | ':' {COLON}
  | '$' {DOLLAR}
  | "$f" {DOLLAR_F}
  | '(' {LPAREN}
  | ')' {RPAREN}
  | '#'[^'\n']* {token lexbuf}
  | '\n' {EOL}
  | eof {EOF}
  | num as s {DECINT (int_of_string s)}
  | hnum as s {HEXINT (int_of_string s)}
  | ident as s {
    try
      Hashtbl.find kw_tbl (uppercase s)
    with
    | Not_found -> LABEL s
  }
  | _ {failwith ("unknown token: " ^ Lexing.lexeme lexbuf)}
