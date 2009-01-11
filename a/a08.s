; Enunciado:
;
; A7:	Faça uma rotina que calcule o resultado da operação (3+2)*(5+4)*(4-1)
;

.file "a08.s"
.include "../lib/auxil.s"
.include "../lib/util.s"

.org 0x1000
	br inicio

ex_a_8::
	sub
	pop lstack
	sub
	rev
	rev
	add
	xcg
	call mymulu
	pop
	
	push lstack
	call mymulu
	pop
ret

inicio::
	push.l #3
	push.l #2
	push.l #5
	push.l #4
	push.l #4
	push.l #1
	call ex_a_8

	halt
.end
