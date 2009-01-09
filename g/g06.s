; Enunciado:
;
; G6:	Faça uma rotina que retorna o valor dum elemento duma matriz.
;	matrizes_le_elemento (end_m coluna linha -- elemento )
;

.file "ex_g_6.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

matriz1::	.long 3,4,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1

matrizes_le_elemento::			; (end_m coluna linha -- elemento )
ret

inicio::
	push #matriz1
	push.l #2
	push.l #1
	call matrizes_le_elemento

	halt
.end
