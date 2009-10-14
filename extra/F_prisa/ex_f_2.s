; Enunciado:
;
; F2:	Desenvolva uma rotina que, dados dois endere�os de in�cio de dois vectores,
;	determine se os dois vectores t�m o mesmo n�mero de elementos:
;	vectorNumElemIguais( end_v1 end_v2 -- -1|0 ) (-1 se sim; 0 se n�o)
;

.file "ex_f_2.s"

.org 0x200        			; programa inicia-se no byte 512 = 0x200
        br inicio
.include "auxil.s"      		; defini��es auxiliares

vector1:: .long 5,234223,4322,0,256543,456545
vector2:  .byte 5

.align 4

.long 234223,4322,0,256543,456545
vector3:: .long 4, 2345,346534,89678,23

;.include "Biblioteca1.s"
; biblioteca de fun��es

vectorNumElemIguais::
	ld.b []
	xcg
	ld[]
	sub
	eqz
ret

inicio::
	push #vector1
	push #vector2
	call vectorNumElemIguais

	push #vector2
	push #vector3
	xcg
	call vectorNumElemIguais

	halt
.end
