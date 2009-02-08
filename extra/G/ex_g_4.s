; Enunciado:
;
; G4:	Faça uma rotina que determine o número de elementos duma matriz.
;	matrizes_numero_elementos(end_M -- numero_elementos)
;

.file "ex_g_4.s"


.org 0x1000        			; programa inicia-se no byte 0x1000
        br inicio
.include "auxil.s"      		; definições auxiliares
.include "biblioteca1.s"			; biblioteca de funções

matriz1::	.long 3,4,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1


matrizes_numero_elementos::

		push
		ld[]
		inc #4
		ld[]
		call mymulu

		ret
	
inicio::
		push #matriz1

		call matrizes_numero_elementos

        	halt
       		.end
