; Enunciado:
;
; A1:		Faça uma rotina que calcule o resultado da operação 5+4-6
;
; 5+4-6 -> 5 4 + 6
;

.file "ex_a_1.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

ex_a_1::
	sub
	add
ret


inicio::
	push.l #5
	push.l #4
	push.l #6
	call ex_a_1

	halt
.end
