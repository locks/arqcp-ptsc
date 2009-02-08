; Enunciado:
;
; F1:	Desenvolva uma rotina que, dado o endereço de início do vector,
;	determina o número de elementos dum vector:
;	vectorNumElem(end_v -- n)
;

.file "ex_f_1.s"

.include "auxil.s"      		; definições auxiliares

.org 0x200        			; programa inicia-se no byte 512 = 0x200

br inicio
;.include "Biblioteca4.s"			

vector1:: .long 5,234223,4322,0,256543,456545
vector2:  .byte 5
.align 4
.long 234223,4322,0,256543,456545

vectorNumElem::
		ld[]
		ret

vectorNumElem1::

		ld.b []
		ret

	
inicio::

		push.l #vector1

		call vectorNumElem

		push.l #vector2

		call vectorNumElem1

        	halt
       		.end