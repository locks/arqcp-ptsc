; Enunciado:
;
; F3:	Desenvolva uma rotina que, dado o endere�o de in�cio do vector e o tamanho de cada elemento,
;	determine o n�mero de bytes que o vector ocupa em mem�ria:
;	vectorTam(end_v tam_e -- n)
;

.file "ex_f_3.s"

.org 0x200        			; programa inicia-se no byte 512 = 0x200
        br inicio

.include "auxil.s"      		; defini��es auxiliares

vector:: .long 5,234223,4322,0,256543,456545

.include "Biblioteca1.s"			; biblioteca de fun��es

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
