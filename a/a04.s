; Enunciado:
;
; A4:	Fa�a uma rotina que calcule o resultado da opera��o 3*2
;

.file "ex_a_4.s"
.include "auxil.s"

.org 0x1000
	br inicio

a04::				; 3*2 -> 3 2 *
	pop g0
	push.l #0
	divu
ret

inicio::
	push.l #3
	push.l #2
	call ex_a_4

	halt
.end