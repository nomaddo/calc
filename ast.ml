type t =
  | Int of int
  | Plus of t * t
  | Minus of t * t
  | Mul of t * t
  | Div of t * t
(* これを書くとppx_derigin.showによりshow: t -> strigがつくられる*)
[@@deriving show]
