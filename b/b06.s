; Enunciado:
;
; B5:	Fa�a uma rotina que escreva uma word na mem�ria.
;	Tome em aten��o que n�o pode alterar as posi��es de mem�ria cont�guas.
;	Na pilha, os par�metros de entrada e de sa�da s�o os apresentados na indica��o feita para refer�ncia � rotina:
;	ESCRW( word ender -- )
;

.file "ex_b_6.s"


.org 0x1000        				; programa inicia-se no byte 0x1000
       	br inicio
.include "auxil.s"      		; defini��es auxiliares
.include "biblioteca.s"			; biblioteca de fun��es

escrw::					;escrw (word addr -- )
					;desc:	escreve um word na mem�ria 
					;input:
					;	word: a word a guardar
					;	addr: o endere�o a guardar a word


	completar

	ret
