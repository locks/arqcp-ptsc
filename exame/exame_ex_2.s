; rotina:
;   eIndiceValido (mat iColuna iLinha -- 0|-1)

; getEnderecoElemento (mat iC iL -- end_elem)
; getNumeroLinhasMatriz (mat -- nL)
; getNumeroColunasMatriz (mat -- nC)
; getTamanhoElementoMatriz (mat -- tamElem)

.file "exame_ex_2.s"
.include "lib/auxil.s"
.include "lib/Biblioteca1.s"
.include "lib/Biblioteca6.s"
.include "lib/Biblioteca4.s"

.org 0x1000
	br inicio

matr1::
	.long 2,2,1,2,3,4

verifica::
	pop lstack
	pop lstack
	pop lstack

	verifica_colunas::
		push r0
		call getNcolunas
		push.n #1
		sub					; transforma número da coluna no índice coluna

		push r1
		mxm

		push r0
		call getNcolunas
		push.n #1
		sub

		sub
	bz verifica_linhas

	push.n #-1
	call house_keeping
ret

verifica_linhas::
	pop
	push r0
	call getNlinhas
	push.n #1
	sub
	push r2
	mxm
	push r0
	call getNlinhas
	push.n #1
	sub
	sub
	bz indice_valido

	push.n #-1
	call house_keeping
ret

valido::
	call house_keeping
	push.n #0
ret

indice_valido::
	push.n #0
	house_keeping::
		push lstack
		push lstack
		push lstack
		pop
		pop
		pop
		pop
ret

main::
	push.l #matr1
	push.n #1
	push.n #4
	call verifica

	halt
.end