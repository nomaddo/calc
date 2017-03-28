{ open Parser                     (* OCamlプログラムを書く部分 *) }

(* 文字の集合の定義 *)
let num = ['0' - '9']
let num_head = ['1' '2' '3' '4' '5' '6' '7' '8' '9']

(* トークンへの切り方の定義 左のパターンにマッチした場合に右の値を返す *)
rule token = parse
| [' ' '\t' '\n'] { token lexbuf } (* 空白、タブ、改行はスキップ *)
| ('0' | (num_head num *)) as str
    { INT (int_of_string str)}     (* 0か左の正規表現で定義される並びは整数 *)
| '+' { PLUS }                     (* +記号はTOKENのPLUSと定義 *)
| '-' { MINUS }                    (* 以下同 *)
| '*' { MUL }
| '/' { DIV }
| eof { EOF }                      (* End of FileだったらEOFトークンを返す *)