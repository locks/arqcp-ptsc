; Enunciado:
;
; A14:	Fa�a uma rotina que fa�a a convers�o M�trico/Imperial.
; 	Na pilha, os par�metros de entrada e de sa�da s�o os apresentados na indica��o feita para refer�ncia � rotina.
;	metroImperial(n1 -- n2)
;
;	As regras de convers�o ser�o:
;	1 Polegada	=	2,5401	Cent�metros
; 	1 P�		=	0,3048	Metros
; 	1 Milha Terrestre	=	1,6093	Quil�metros
; 	1 Milha Mar�tima	=	1,8522	Quil�metros

.file "ex_a_14.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
	br inicio
.include  "auxil.s"      		; defini��es auxiliares
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