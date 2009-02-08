; Enunciado:
;
; A14:	Faça uma rotina que faça a conversão Métrico/Imperial.
; 	Na pilha, os parâmetros de entrada e de saída são os apresentados na indicação feita para referência à rotina.
;	metroImperial(n1 -- n2)
;
;	As regras de conversão serão:
;	1 Polegada	=	2,5401	Centímetros
; 	1 Pé		=	0,3048	Metros
; 	1 Milha Terrestre	=	1,6093	Quilómetros
; 	1 Milha Marítima	=	1,8522	Quilómetros

.file "ex_a_14.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
	br inicio
.include  "auxil.s"      		; definições auxiliares
.include  "UTIL.s"

metroImperial::				;  (n1 -- n2)

	ret

pol2cent::

	push.l #25401
	call mymulu
	push.l #10000
	call mydivu
	pop
	ret

inicio::

	call metroImperial

	halt
	.end