; Enunciado:
;
; B2:	Fa�a uma rotina que partindo de 3 valores de 32 bits, colocados em mem�ria, se obtenha o resultado da seguinte express�o matem�tica: n3=(n1*n2).
;	Na pilha, os par�metros de entrada e de sa�da s�o os apresentados na indica��o feita para refer�ncia � rotina:
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