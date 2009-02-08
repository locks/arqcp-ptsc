; Enunciado:
;
; B5:	Fa�a uma rotina que escreva um byte na mem�ria.
;	Tome em aten��o que n�o pode alterar as posi��es de mem�ria cont�guas.
;	Na pilha, os par�metros de entrada e de sa�da s�o os apresentados na indica��o feita para refer�ncia � rotina:
;	ESCRB( byte ender -- )
;

.file "ex_b_5.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
        br inicio
.include "auxil.s"      		; defini��es auxiliares
					; biblioteca de fun��es
.include "biblioteca.s"

b1::	.byte 02
b2:	.byte 03
b3:	.byte 00

inicio::
	push.l #b1
	ld.b []
	push.l #b2
	ld.b []
	call mymulu
	pop
	push.l #b3
	call escrb
	

	push.l #b3
	ld[]
	replb
	halt
       	.end