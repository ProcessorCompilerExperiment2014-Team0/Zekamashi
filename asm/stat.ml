open AsmSyntax
open AsmParser
open AsmLexer
open Printf
open Scanf
open Conv

let rec read ch l =
  try
    let (pc,cnt) = fscanf ch "%d %d\n" (fun x y->(x,y)) in
    read ch ((cnt,pc)::l)
  with
    | End_of_file -> l

let rec reg tbl n = function
  | [] -> ()
  | (lbl,m,_)::is ->
    Hashtbl.add tbl n lbl;
    reg tbl (n+1) is

let show tbl (cnt,pc) =
  let s =
    try
      match Hashtbl.find tbl pc with
        | [] -> "    ;; (no label)"
        | l -> string_of_label l
    with
      | Not_found -> "    ;; (no label)" in
  printf "%12d %08X %s\n" cnt pc s

let main () =
  let asm_ch = open_in Sys.argv.(1) in
  let log_ch = open_in Sys.argv.(2) in
  let lexbuf = Lexing.from_channel asm_ch in
  let asm = insts token lexbuf in
  let tbl = Hashtbl.create (List.length asm) in
  reg tbl 0 asm;
  let stat_l = List.rev (List.sort compare (read log_ch [])) in
  List.iter (show tbl) stat_l;

  close_in asm_ch; close_in log_ch

;;
main ()
