; Enunciado:
;
; F1:	Desenvolva uma rotina que, dado o endereço de início do vector,
;	determina o número de elementos dum vector:
;	vectorNumElem(end_v -- n)
;

.file "ex_f_1.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

vector1:: .long 5,234223,4322,0,256543,456545
vector2:  .byte 5
.align 4
	  .long 234223,4322,0,256543,456545

vectorNumElem::
ret

inicio::
	call vectorNumElem

	halt
.end
