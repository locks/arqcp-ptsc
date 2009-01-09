; Enunciado:
;
; B2:	Faça uma rotina que partindo de 3 valores de 32 bits, colocados em memória, se obtenha o resultado da seguinte expressão matemática: n3=(n1*n2).
;	Na pilha, os parâmetros de entrada e de saída são os apresentados na indicação feita para referência à rotina:
;	F2(n1 n2 -- n3 )
;

.file "ex_b_2.s"
.include "auxil.s"
.include "biblioteca.s"

.org 0x1000
	br inicio

n1::	.long	2
n2:	.long	3
n3:	.long 0

; F2(n1 n2 -- n3): n3=(n1*n2)
F2::
	call mymulu
	pop
ret

inicio::
	push.l #2
	push.l #3
	call F2
	push.n #n3
	st []
	
	push.n #n1
	ld []
	push.n #n2
	ld []
	call F2
	push.n #n3
	st []

	halt
.end