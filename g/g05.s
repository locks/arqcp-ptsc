; Enunciado:
;
; G5:	Faça uma rotina que determina o endereço dum elemento duma matriz de longs.
;	matrizes_endereco_elemento (end_m coluna linha -- endereco_elemento )
;

.file "ex_g_5.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

matriz1::	.long 3,4,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1

matrizes_endereco_elemento::		; (end_m coluna linha -- endereco_elemento )
ret


inicio::
	push #matriz1
	push #1
	push #2
	call matrizes_endereco_elemento

	halt
.end
