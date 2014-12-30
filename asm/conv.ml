open AsmSyntax
open Printf

exception Unbound_label of string list * int * mnemonic * arg list
exception Duplicative_label of string list * int * mnemonic * arg list
exception Unknown_instruction of string list * int * mnemonic * arg list
exception Immd_out_of_bounds of string list * int * mnemonic * arg list

let string_of_label = function
  | [] -> ""
  | ls ->
    let rec go = function
      | [] -> ""
      | [l] -> l
      | l::ls -> l ^ ", " ^ go ls in
    "    ;; " ^ go ls

let string_of_mn = function
  | M_LDA -> "LDA"
  | M_LDAH -> "LDAH"
  | M_LDL -> "LDL"
  | M_STL -> "STL"
  | M_BEQ -> "BEQ"
  | M_BNE -> "BNE"
  | M_BR -> "BR"
  | M_BSR -> "BSR"
  | M_JMP -> "JMP"
  | M_JSR -> "JSR"
  | M_RET -> "RET"
  | M_ADDL -> "ADDL"
  | M_SUBL -> "SUBL"
  | M_CMPEQ -> "CMPEQ"
  | M_CMPLE -> "CMPLE"
  | M_CMPLT -> "CMPLT"
  | M_AND -> "AND"
  | M_BIS -> "BIS"
  | M_XOR -> "XOR"
  | M_EQV -> "EQV"
  | M_SLL -> "SLL"
  | M_SRL -> "SRL"
  | M_SRA -> "SRA"
  | M_LDS -> "LDS"
  | M_STS -> "STS"
  | M_FBEQ -> "FBEQ"
  | M_FBNE -> "FBNE"
  | M_CMPSEQ -> "CMPSEQ"
  | M_CMPSLE -> "CMPSLE"
  | M_CMPSLT -> "CMPSLT"
  | M_ADDS -> "ADDS"
  | M_SUBS -> "SUBS"
  | M_MULS -> "MULS"
  | M_INVS -> "INVS"
  | M_SQRTS -> "SQRTS"
  | M_CVTSL_C -> "CVTSL/C"
  | M_CVTLS -> "CVTLS"
  | M_FTOIS -> "FTOIS"
  | M_ITOFS -> "ITOFS"

let string_of_immd = function
  | I_Dec i -> string_of_int i
  | I_Hex i -> sprintf "0x%X" i

let string_of_arg tbl = function
  | A_Immd i -> string_of_immd i
  | A_R n -> "$"^string_of_int n
  | A_Rm n -> "($"^string_of_int n^")"
  | A_F n -> "$f"^string_of_int n
  | A_Disp (n,d) -> string_of_immd d^"($"^string_of_int n^")"
  | A_Label s -> s

let rec string_of_args tbl = function
  | [] -> ""
  | [a] -> string_of_arg tbl a
  | a::aa -> string_of_arg tbl a ^ ", " ^ string_of_args tbl aa

let check_signed len n =
  if -1 lsl (len-1) <= n && n < 1 lsl (len-1)
  then ((1 lsl len) - 1) land n
  else failwith "Immd out of bounds"

let check_unsigned len n =
  if 0 <= n && n < 1 lsl len
  then n
  else failwith "Immd out of bounds"

let check_immd len sign = function
  | I_Dec n ->
    if sign
    then check_signed len n
    else check_unsigned len n
  | I_Hex n -> check_unsigned len n

let rec align res tbl n = function
  | [] -> res
  | (lbl,m,args)::is ->
    List.iter
      (fun l -> if Hashtbl.mem tbl l
        then raise (Duplicative_label ([l],n,m,args))
        else Hashtbl.add tbl l n) lbl;
    align ((lbl,n,m,args)::res) tbl (n+1) is

let get_disp tbl src lbl =
  let dst = Hashtbl.find tbl lbl in
  dst - src

let enc_mem opcd ra rb df =
  opcd lsl 26 lor
    ra lsl 21 lor
    rb lsl 16 lor
    df

let enc_bra opcd ra df =
  opcd lsl 26 lor
    ra lsl 21 lor
    df

let enc_opr opcd ra rb rc fc =
  opcd lsl 26 lor
    ra lsl 21 lor
    rb lsl 16 lor
    fc lsl 5 lor
    rc

let enc_opr_lit opcd ra lb rc fc =
  opcd lsl 26 lor
    ra lsl 21 lor
    lb lsl 13 lor
    0x1000 lor
    fc lsl 5 lor
    rc

let put_int ch n =
  output_byte ch n;
  output_byte ch (n lsr 8);
  output_byte ch (n lsr 16);
  output_byte ch (n lsr 24)

let encode tbl (lbl,place,mn,args) =
  try
    (match (mn,args) with
    | (M_LDA, [A_R a; A_Disp (b, d)]) -> enc_mem 0x08 a b (check_immd 16 true d)
    | (M_LDAH, [A_R a; A_Disp (b, d)]) -> enc_mem 0x09 a b (check_immd 16 true d)
    | (M_LDL, [A_R a; A_Disp (b, d)]) -> enc_mem 0x28 a b (check_immd 16 true d)
    | (M_STL, [A_R a; A_Disp (b, d)]) -> enc_mem 0x2c a b (check_immd 16 true d)
    | (M_BEQ, [A_R a; A_Immd d]) -> enc_bra 0x39 a (check_immd 21 true d)
    | (M_BEQ, [A_R a; A_Label l]) -> let d = get_disp tbl place l in
                                     enc_bra 0x39 a (check_signed 21 d)
    | (M_BNE, [A_R a; A_Immd d]) -> enc_bra 0x3d a (check_immd 21 true d)
    | (M_BNE, [A_R a; A_Label l]) -> let d = get_disp tbl place l in
                                     enc_bra 0x3d a (check_signed 21 d)
    | (M_BR, [A_R a; A_Immd d]) -> enc_bra 0x30 a (check_immd 21 true d)
    | (M_BR, [A_R a; A_Label l]) -> let d = get_disp tbl place l in
                                    enc_bra 0x30 a (check_signed 21 d)
    | (M_BSR, [A_R a; A_Immd d]) -> enc_bra 0x34 a (check_immd 21 true d)
    | (M_BSR, [A_R a; A_Label l]) -> let d = get_disp tbl place l in
                                     enc_bra 0x34 a (check_signed 21 d)
    | (M_JMP, [A_R a; A_Rm b]) -> enc_mem 0x1a a b 0x00
    | (M_JSR, [A_R a; A_Rm b]) -> enc_mem 0x1a a b 0x40
    | (M_RET, [A_R a; A_Rm b]) -> enc_mem 0x1a a b 0x80
    | (M_ADDL, [A_R a; A_R b; A_R c]) -> enc_opr 0x10 a b c 0x00
    | (M_ADDL, [A_R a; A_Immd b; A_R c]) -> enc_opr_lit 0x10 a (check_immd 8 false b) c 0x00
    | (M_SUBL, [A_R a; A_R b; A_R c]) -> enc_opr 0x10 a b c 0x09
    | (M_SUBL, [A_R a; A_Immd b; A_R c]) -> enc_opr_lit 0x10 a (check_immd 8 false b) c 0x09
    | (M_CMPEQ, [A_R a; A_R b; A_R c]) -> enc_opr 0x10 a b c 0x2d
    | (M_CMPEQ, [A_R a; A_Immd b; A_R c]) -> enc_opr_lit 0x10 a (check_immd 8 false b) c 0x2d
    | (M_CMPLE, [A_R a; A_R b; A_R c]) -> enc_opr 0x10 a b c 0x6d
    | (M_CMPLE, [A_R a; A_Immd b; A_R c]) -> enc_opr_lit 0x10 a (check_immd 8 false b) c 0x6d
    | (M_CMPLT, [A_R a; A_R b; A_R c]) -> enc_opr 0x10 a b c 0x4d
    | (M_CMPLT, [A_R a; A_Immd b; A_R c]) -> enc_opr_lit 0x10 a (check_immd 8 false b) c 0x4d
    | (M_AND, [A_R a; A_R b; A_R c]) -> enc_opr 0x11 a b c 0x00
    | (M_AND, [A_R a; A_Immd b; A_R c]) -> enc_opr_lit 0x11 a (check_immd 8 false b) c 0x00
    | (M_BIS, [A_R a; A_R b; A_R c]) -> enc_opr 0x11 a b c 0x20
    | (M_BIS, [A_R a; A_Immd b; A_R c]) -> enc_opr_lit 0x11 a (check_immd 8 false b) c 0x20
    | (M_XOR, [A_R a; A_R b; A_R c]) -> enc_opr 0x11 a b c 0x40
    | (M_XOR, [A_R a; A_Immd b; A_R c]) -> enc_opr_lit 0x11 a (check_immd 8 false b) c 0x40
    | (M_EQV, [A_R a; A_R b; A_R c]) -> enc_opr 0x11 a b c 0x48
    | (M_EQV, [A_R a; A_Immd b; A_R c]) -> enc_opr_lit 0x11 a (check_immd 8 false b) c 0x48
    | (M_SLL, [A_R a; A_R b; A_R c]) -> enc_opr 0x12 a b c 0x39
    | (M_SLL, [A_R a; A_Immd b; A_R c]) -> enc_opr_lit 0x12 a (check_immd 8 false b) c 0x39
    | (M_SRL, [A_R a; A_R b; A_R c]) -> enc_opr 0x12 a b c 0x34
    | (M_SRL, [A_R a; A_Immd b; A_R c]) -> enc_opr_lit 0x12 a (check_immd 8 false b) c 0x34
    | (M_SRA, [A_R a; A_R b; A_R c]) -> enc_opr 0x12 a b c 0x3c
    | (M_SRA, [A_R a; A_Immd b; A_R c]) -> enc_opr_lit 0x12 a (check_immd 8 false b) c 0x3c
    | (M_LDS, [A_F a; A_Disp (b, d)]) -> enc_mem 0x22 a b (check_immd 16 true d)
    | (M_STS, [A_F a; A_Disp (b, d)]) -> enc_mem 0x26 a b (check_immd 16 true d)
    | (M_FBEQ, [A_F a; A_Immd d]) -> enc_bra 0x31 a (check_immd 21 true d)
    | (M_FBEQ, [A_F a; A_Label l]) -> let d = get_disp tbl place l in
                                      enc_bra 0x31 a (check_signed 21 d)
    | (M_FBNE, [A_F a; A_Immd d]) -> enc_bra 0x35 a (check_immd 21 true d)
    | (M_FBNE, [A_F a; A_Label l]) -> let d = get_disp tbl place l in
                                      enc_bra 0x35 a (check_signed 21 d)
    | (M_CMPSEQ, [A_F a; A_F b; A_F c]) -> enc_opr 0x16 a b c 0x0a5
    | (M_CMPSLE, [A_F a; A_F b; A_F c]) -> enc_opr 0x16 a b c 0x0a7
    | (M_CMPSLT, [A_F a; A_F b; A_F c]) -> enc_opr 0x16 a b c 0x0a6
    | (M_ADDS, [A_F a; A_F b; A_F c]) -> enc_opr 0x16 a b c 0x080
    | (M_SUBS, [A_F a; A_F b; A_F c]) -> enc_opr 0x16 a b c 0x081
    | (M_MULS, [A_F a; A_F b; A_F c]) -> enc_opr 0x16 a b c 0x082
    | (M_INVS, [A_F b; A_F c]) -> enc_opr 0x16 0x1f b c 0x083
    | (M_SQRTS, [A_F b; A_F c]) -> enc_opr 0x14 0x1f b c 0x08b
    | (M_CVTSL_C, [A_F b; A_F c]) -> enc_opr 0x16 0x1f b c 0x02f
    | (M_CVTLS, [A_F b; A_F c]) -> enc_opr 0x16 0x1f b c 0x0be
    | (M_FTOIS, [A_F a; A_R c]) -> enc_opr 0x1c a 0x1f c 0x078
    | (M_ITOFS, [A_R a; A_F c]) -> enc_opr 0x14 a 0x1f c 0x004
    | _ -> raise (Unknown_instruction (lbl,place,mn,args)))
  with
  | Failure s -> raise (Immd_out_of_bounds (lbl,place,mn,args))
  | Not_found -> raise (Unbound_label (lbl,place,mn,args))
  | e -> raise e

let show ot tbl (lbl,place,mn,args) =
  fprintf ot "%08X:     %04X = %s %s%s\n" place
    (encode tbl (lbl,place,mn,args))
    (string_of_mn mn) (string_of_args tbl args)
    (string_of_label lbl)

let show_error ot tbl (lbl,place,mn,args) =
  fprintf ot "%08X: %s %s%s\n" place
    (string_of_mn mn) (string_of_args tbl args)
    (string_of_label lbl)
