; Enunciado:
;
; F3:	Desenvolva uma rotina que, dado o endereço de início do vector e o tamanho de cada elemento,
;	determine o número de bytes que o vector ocupa em memória:
;	vectorTam(end_v tam_e -- n)
;

.file "ex_f_3.s"

.org 0x200        			; programa inicia-se no byte 512 = 0x200
        br inicio

.include "auxil.s"      		; definições auxiliares

vector:: .long 5,234223,4322,0,256543,456545

.include "Biblioteca1.s"			; biblioteca de funções

vectorTam::
		xcg
		ld[]
		call mymulu
		pop
		ret

	
inicio::

		push.l #vector
		push #4
		call vectorTam

        	halt
       		.end
