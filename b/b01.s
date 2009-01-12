; Enunciado:
;
; B1:	Faça uma rotina que partindo de 3 valores de 32 bits, colocados em memória, se obtenha o resultado da seguinte expressão matemática: n4=n1+n2-n3.
; Na pilha, os parâmetros de entrada e de saída são os apresentados na indicação feita para referência à rotina:
;	F1(n1 n2 n3 -- n4)
;

.file "ex_b_1.s"
.include "auxil.s"

.org 0x1000
	br inicio

n1:	.long	2
n2:	.long	3
n3:	.long	4
n4:	;n‹o me lembro como Ž

; F1(n1 n2 n3 – n4): n4=n1+n2-n3
F1::
	sub
	add
ret

store::
	push.n #n4
	st []
ret

inicio::
	push.l #2
	push.l #3
	push.l #4
	call F1
	call store

	push.n #n1
	ld []
	push.n #n2
	ld []
	push.n #n3
	ld []
	call F1
	call store
	
	halt
.end
