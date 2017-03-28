OCAMLC=ocamlfind ocamlc ${LIB}
OCAMLOPT=ocamlfind ocamlopt ${LIB}
OCAMLDEP=ocamlfind ocamldep

INCLUDE=
LIB=-package ppx_deriving.show,batteries

OBJS= ast.cmo parser.cmo lexer.cmo main.cmo

calc: ast.cmo parser.cmi parser.cmo lexer.cmo main.cmo
	$(OCAMLC) $(LIB) -linkpkg -linkall -o $@ $(OBJS)

%.cmi: %.mli
	${OCAMLC} ${INCLUDE} -c ${LIB} ${OPT} $<
%.cmo: %.ml
	${OCAMLC} ${INCLUDE} -c ${LIB} ${OPT} $<
%.cmx: %.ml
	${OCAMLOPT} ${INCLUDE} -c ${LIB} ${OPT} $<
%.ml: %.mll
	ocamllex $<
%.ml: %.mly
	menhir --infer -v --ocamlc 'ocamlc -I parsing' $<
%.mli: %.mly
	menhir --infer -v --ocamlc 'ocamlc -I parsing' $<

.PHONY: clean test
