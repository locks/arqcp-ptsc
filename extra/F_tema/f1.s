; Enunciado:
;
; F1:	Desenvolva uma rotina que, dado o endere�o de in�cio do vector,
;	determina o n�mero de elementos dum vector:
;	vectorNumElem(end_v -- n)
;

.file "ex_f_1.s"

.include "auxil.s"      		; defini��es auxiliares

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio



vector1:: .long 5,234223,4322,0,256543,456545



vectorNumElem::
		ld []
		ret

	
inicio::

		push #vector1
		call vectorNumElem

        	halt
       		.end
