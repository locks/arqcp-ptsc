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

	push

	call getNumeroLinhasMatriz
	push.n #1
	sub
	pop lstack

	call getNumeroColunasMatriz
	push.n #1
	sub
	;
	; (matColunas  | r0: matLinhas, r1: iColuna, r2: iLinha)
	;
	push r1
	mxm
	push.n #0
	mxm
ret

fim_1::
	pop
	pop
	push lstack
	push lstack
	

main::
	push.l #matr1
	push.n #1
	push.n #4
	call verifica

	halt
.end