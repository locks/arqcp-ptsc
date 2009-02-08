; Enunciado:
;
; B5:	Fa�a uma rotina que escreva um byte na mem�ria.
;	Tome em aten��o que n�o pode alterar as posi��es de mem�ria cont�guas.
;	Na pilha, os par�metros de entrada e de sa�da s�o os apresentados na indica��o feita para refer�ncia � rotina:
;	ESCRB( byte ender -- )
;

.file "ex_b_5.s"

.org 0x1000        				; programa inicia-se no byte 0x1000
        br inicio
.include "auxil.s"      		; defini��es auxiliares
.include "biblioteca.s"			; biblioteca de fun��es

b1: .byte 0

escrb::	Push x
	pop lstack
	pop x
	lp[x]				;escrb (byte addr -- )
	repl b1				;desc:	escreve um byte na mem�ria 
	st[x]				;input:
	push lstack				;	byte: o byte a guardar
	pop x				;	addr: o endere�o a guardar o byte
	ret	
inicio::
	push.n #0
	push.l #b1
	call escrb
	halt
	.end