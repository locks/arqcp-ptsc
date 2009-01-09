; Enunciado:
;
; A11:	Repita o exercício A9 utilizando a rotina desenvolvida no exercício anterior.
;

.file "ex_a_11.s"
.include "../lib/auxil.s"
.include "../lib/biblioteca1.s"

.org 0x1000
	br inicio

ex_a_11::
	push.l #0
	xcg
	call mydivu
ret

inicio::
	push.l #3
	push.l #2
	call ex_a_11

	halt
.end