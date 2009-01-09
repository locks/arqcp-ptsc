; Enunciado:
;
; G4:	Faça uma rotina que determine o número de elementos duma matriz.
;	matrizes_numero_elementos(end_M -- numero_elementos)
;

.file "ex_g_4.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

matriz1::	.long 3,4,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1

matrizes_numero_elementos::
ret

inicio::
	push #matriz1
	call matrizes_numero_elementos

	halt
.end
