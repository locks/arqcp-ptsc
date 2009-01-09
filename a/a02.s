; Enunciado:
;
; A2:	Faça uma rotina que calcule o resultado da operação 1-(2+5)
;

.file "ex_a_2.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

ex_a_2::				; 1-(2+5) -> 1 2 5 + -
	add
	sub
ret

inicio::
	push.l #1
	push.l #2
	push.l #5
	call ex_a_2

	halt
.end