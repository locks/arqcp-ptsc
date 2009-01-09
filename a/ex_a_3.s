; Enunciado:
;
; A3:	Faça uma rotina que calcule o resultado da operação (3+2)-(3-5)
;

.file "ex_a_3.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

ex_a_3::			; (3+2)-(3-5) -> 3 2 + 3 5 - -
	sub
	rev
	rev
	add
	xcg
	sub
ret

inicio::
	push.l #3
	push.l #2
	push.l #3
	push.l #5
	call ex_a_3

	halt
.end