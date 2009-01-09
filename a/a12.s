; Enunciado:
;
; A12:	Faça uma rotina que calcule o resultado da operação (3+2)/(5+4)/(4-1)
;

.file "ex_a_12.s"
.include "auxil.s"

.org 0x1000
	br inicio

ex_a_12_alt:: ; (3+2)/(5+4)/(4-1)
	sub
	pop lstack
	add
	pop lstack
	add
	
	push.l #0
	push lstack
	call mydivu
	pop
	
	push.l #0
	push lstack
	call mydivu
	pop
ret

inicio::
	push.l #3
	push.l #2
	push.l #5
	push.l #4
	push
	push.l #1
	call ex_a_12

	halt
.end
