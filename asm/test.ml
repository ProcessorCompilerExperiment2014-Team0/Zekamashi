#load "asmSyntax.cmo";;
#load "asmParser.cmo";;
#load "asmLexer.cmo";;

open AsmSyntax
open AsmParser
open AsmLexer

let s2t str =
  let lexbuf = Lexing.from_string str in
  let rec conv buf =
    match AsmLexer.token lexbuf with
        AsmParser.EOL -> []
      | t -> t::conv buf in
  conv lexbuf

let f2t str =
  let lexbuf = Lexing.from_channel (open_in str) in
  let rec conv buf =
    match AsmLexer.token lexbuf with
        AsmParser.EOF -> []
      | t -> t::conv buf in
  conv lexbuf

let f2i str =
  let lexbuf = Lexing.from_channel (open_in str) in
  insts token lexbuf
