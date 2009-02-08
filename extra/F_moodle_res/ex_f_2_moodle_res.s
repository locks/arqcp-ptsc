; Enunciado:
;
; F2:	Desenvolva uma rotina que, dados dois endere�os de in�cio de dois vectores,
;	determine se os dois vectores t�m o mesmo n�mero de elementos:
;	vectorNumElemIguais( end_v1 end_v2 -- -1|0 ) (-1 se sim; 0 se n�o)
;

.file "ex_f_2_moodle_res.s"

.include "auxil.s"      		; defini��es auxiliares

.org 0x1000        			; programa inicia-se no byte 4096 = 0x1000

        br inicio

vector1:: .long 5,234223,4322,0,256543,456545
vector2:  .byte 5
	.align 4
	.long 234223,4322,0,256543,456545
vector3:: .long 4, 2345,346534,89678,23

vectorNumElemIguais1::				;( end_v1 end_v2 -- -1|0 )

		ld.b []						;ler o byte da mem�ria
		xcg
		ld []						;ler o long da mem�ria 
		xor
		eqz
		ret

vectorNumElemIguais2::				;( end_v1 end_v2 -- -1|0 )
		ld []						;ler o long da mem�ria
		xcg
		ld.b []						;ler o byte da mem�ria
		xor
		eqz
		ret
	
inicio::	
		push #vector1
		push #vector2
		call vectorNumElemIguais1

		push #vector2
		push #vector3
		call vectorNumElemIguais2

        halt
       	.end
