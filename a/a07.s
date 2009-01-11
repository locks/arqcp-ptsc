; Enunciado:
;
; A8:		Faça uma rotina que calcule o resultado da operação -3*2
;

.file "a07.s"
.include "../lib/auxil.s"
.include "../lib/util.s"

.org 0x1000
	br inicio

a07::
	call mymulu
	pop
ret

inicio::
	push.l #-3
	push.l #2
	call ex_a_7

	halt
.end
