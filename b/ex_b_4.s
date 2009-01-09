; Enunciado:
;
; B4:	Faça uma rotina que partindo de valores de 32 bits, existentes na memória, se obtenha o resultado da sua divisão.
;	Utilize a rotina que desenvolveu em A11.
;

.file "ex_b_4.s"
.include "auxil.s"
.include "biblioteca.s"

.org 0x1000
	br inicio

n1::	.long	2
n2:	.long	3
n3:	.long	0

; F4(n1 n2 -- n3): n3=(n1/n2)
F4::
	push.l #0
	xcg
	call mydivu
ret

inicio::
	push.n #n1
	ld []
	push.n #n2
	ld []
	call F4
	push.n #n3
	st []

	halt
.end