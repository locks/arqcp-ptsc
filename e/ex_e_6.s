; Enunciado:
;
; E6:	Desenvolva uma função, que leia um valor numérico do teclado (não ASCII!), escreva esse valor na memória.
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