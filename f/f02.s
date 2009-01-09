; Enunciado:
;
; F2:	Desenvolva uma rotina que, dados dois endereços de início de dois vectores,
;	determine se os dois vectores têm o mesmo número de elementos:
;	vectorNumElemIguais( end_v1 end_v2 -- -1|0 ) (-1 se sim; 0 se não)
;

.file "ex_f_2.s"
.include "../lib/auxil.s"

vector1:: .long 5,234223,4322,0,256543,456545
vector2:  .byte 5

.align 4
	  .long 234223,4322,0,256543,456545

vector3:: .long 4, 2345,346534,89678,23

vectorNumElemIguais::
ret

inicio::
	push #vector1
	push #vector2
	call vectorNumElemIguais

	push #vector2
	push #vector3
	call vectorNumElemIguais

	halt
.end
