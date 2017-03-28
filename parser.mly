%{
  open Ast
%}

%token <int> INT    (* TOKENの定義 *)
%token PLUS, MINUS, MUL, DIV
%token EOF

%type <Ast.t> main  (* 開始ポイントの定義、Ast.t型を返すルール *)
%start main

%%

main:               (* プログラムはexprとEOFである *)
| expr EOF { $1 }

expr:               (* 式(expr)は整数か、式+式、式-式、式*式、式/式 である *)
| INT { Int $1 }
| expr PLUS expr  { Plus ($1, $3)  } (* PLUSはトークン、PlusはAstの構成要素 *)
| expr MINUS expr { Minus ($1, $3) }
| expr MUL expr   { Mul ($1, $3)   }
| expr DIV expr   { Div ($1, $3)   }
