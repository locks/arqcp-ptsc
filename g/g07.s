; Enunciado:
;
; G7:	Faça uma rotina que grave o valor dum elemento duma matriz.
;	matrizes_grava_elemento (end_m coluna linha elemento -- )
;

.file "ex_g_7.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

matriz1::	.long 3,4,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1

matrizes_grava_elemento::			; (end_m coluna linha elemento -- )
ret

inicio::
	push #matriz1
	push.l #2
	push.l #1
	push.l #45
	call matrizes_grava_elemento

	; testa se gravou
	push #matriz1
	push.l #2
	push.l #1
	call matrizes_le_elemento

	halt
.end
