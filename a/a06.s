; Enunciado:
;
; A6:	Repita o exerc�cio A4 utilizando a rotina desenvolvida no exerc�cio anterior.
;

.file "a06.s"
.include "../lib/auxil.s"
.include "a05.s"

.org 0x1000
	br inicio


inicio::
	push.l #3
	push.l #2
	call mymulu

	halt
	.end