; Enunciado:
;
; B1:	Fa�a uma rotina que partindo de 3 valores de 32 bits, colocados em mem�ria, se obtenha o resultado da seguinte express�o matem�tica: n4=n1+n2-n3.
; Na pilha, os par�metros de entrada e de sa�da s�o os apresentados na indica��o feita para refer�ncia � rotina:
;	F1(n1 n2 n3 -- n4)
;

.file "ex_b_1.s"
.include "auxil.s"

.org 0x1000
	br inicio

n1:	.long	2
n2:	.long	3
n3:	.long	4
n4:	;n�o me lembro como �

; F1(n1 n2 n3 � n4): n4=n1+n2-n3
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
