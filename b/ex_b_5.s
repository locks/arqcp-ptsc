; Enunciado:
;
; B5:	Fa�a uma rotina que escreva um byte na mem�ria.
;	Tome em aten��o que n�o pode alterar as posi��es de mem�ria cont�guas.
;	Na pilha, os par�metros de entrada e de sa�da s�o os apresentados na indica��o feita para refer�ncia � rotina:
;	ESCRB( byte ender -- )
;

.file "ex_b_5.s"
.include "auxil.s"
.include "biblioteca.s"

.org 0x1000
	br inicio

escrb::			;escrb (byte addr -- )
					;desc:	escreve um byte na mem�ria 
					;input:
					;	byte: o byte a guardar
					;	addr: o endere�o a guardar o byte
ret	
