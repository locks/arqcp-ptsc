; Enunciado:
;
; E6:	Desenvolva uma fun��o, que leia um valor num�rico do teclado (n�o ASCII!), escreva esse valor na mem�ria.
;	inInt( n -- )
;

.file "ex_e_6.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

inInt::
ret

inicio::

	call inInt

	halt
	.end