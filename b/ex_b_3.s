; Enunciado:
;
; B3:	Faça uma rotina que partindo de valores de 32 bits, existentes na memória, se obtenha o resultado da sua multiplicação.
;	Utilize a rotina que desenvolveu em A7.
;

.file "ex_b_3.s"
.include "auxil.s"
.include "biblioteca.s"

.org 0x1000
	br inicio

n1::	.long	2
n2:	.long	3
n3:	.long	0
n4:	.long	0

; F3(n1 n2 -- n3): n3=(n1*n2)
F3::
	call mymulu
	pop
ret

inicio::
	push.n #n1
	ld []
	push.n #n2
	ld []
	call F3
	push.n #n3
	st []

	halt
.end