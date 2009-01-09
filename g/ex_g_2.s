; Enunciado:
;
; G2:	Faça uma rotina que determine o número de linhas duma matriz.
;	matrizes_numero_linhas(end_M1 -- numero_linhas)
;

.file "ex_g_2.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

matriz1::	.long 3,4,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1

matrizes_numero_linhas::			; (end_m -- numero_linhas )
ret

inicio::
	push #matriz1
	call matrizes_numero_linhas

	halt
.end
