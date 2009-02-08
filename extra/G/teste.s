; Enunciado:
;
; G7:	Faça uma rotina que grave o valor dum elemento duma matriz.
;	matrizes_grava_elemento (end_m coluna linha elemento -- )
;

.file "ex_g_7.s"
.include "auxil.s"
.include "biblioteca.s"

.org 0x1000
	br inicio

matriz1:: .long 1,2,3,4,5,6,7,8,9

inicio::
	push.l #matriz1
	pop lstack
	ld [r0++]
	ld [r0++]
	add
	ld [r0++]
	ld [r0++]
	ld [r0++]
	ld [r0++]
	ld [r0++]
	
	push.n #3
	push.n #2
	call getElemAddr
	ld []

	halt
.end
