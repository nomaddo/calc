let main () =
  while true do
    let lexbuf = Lexing.from_string (read_line ()) in
    let ast = Parser.main Lexer.token lexbuf in
    Format.printf "%s@." (Ast.show ast)
  done

let () = main ()
