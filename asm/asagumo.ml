open AsmSyntax
open AsmParser
open AsmLexer
open Conv

exception Option_format

type opt = {mutable ofile: string; mutable bootloader: bool}

let write ot tbl asm =
  List.iter (put_int ot) (List.map (Conv.encode tbl) asm)

let print_options () =
  prerr_endline "Option format error";
  prerr_endline "Usage: zasm [input file] [options]";
  prerr_endline "  -b            Output for bootloader";
  prerr_endline "  -o <filename> Set output file"

let rec get_option n opt =
  let len = Array.length Sys.argv in
  if n < len
  then match Sys.argv.(n) with
  | "-b" -> opt.bootloader <- true;
    get_option (n+1) opt
  | "-o" ->
    if (n+1) < len
    then opt.ofile <- Sys.argv.(n+1)
    else raise Option_format;
    get_option (n+2) opt
  | _ -> raise Option_format
  else opt

let main () =
  if Array.length Sys.argv < 2 then
    prerr_endline "Usage: zasm [input file] [options]"
  else
    try
      let input = open_in Sys.argv.(1) in
      let lexbuf = Lexing.from_channel input in
      let asm = insts token lexbuf in
      let ofile = String.sub Sys.argv.(1) 0 (String.length Sys.argv.(1) - 2) in
      let opt = get_option 2 {ofile = ofile; bootloader = false} in
      let output = open_out_bin opt.ofile in
      let tbl = Hashtbl.create (List.length asm) in
      try
        let origin = if opt.bootloader then 0x40 else 0 in
        let asm' = expand [] tbl (align [] tbl origin asm) in
        write output tbl asm';
        if opt.bootloader then
          List.iter (output_byte output) [0;0;0;0]
        else ();
        List.iter (show stdout tbl) asm'
      with
      | Unbound_label (l,p,m,a) -> prerr_endline "Unbound label:";
        show_error stderr tbl (l,p,m,a)
      | Duplicative_label (l,p,m,a) -> prerr_endline "Duplicative label:";
        show_error stderr tbl (l,p,m,a)
      | Unknown_instruction (l,p,m,a) -> prerr_endline "Unknown instruction:";
        show_error stderr tbl (l,p,m,a)
      | Immd_out_of_bounds (l,p,m,a) -> prerr_endline "Immediate out of bounds:";
        show_error stderr tbl (l,p,m,a);
        close_in input; close_out output
    with
    | Sys_error e -> prerr_endline e
    | Parsing.Parse_error -> prerr_endline "Parse Error"
    | Option_format -> print_options ()
    | Failure s -> prerr_endline s

;;
main ()
