; Enunciado:
;
; E5:	Desenvolva uma fun��o, que a partir de um valor escrito na mem�ria (n�o ASCII!), 
;	escreva esse valor como um valor num�rico inteiro no monitor.
;	outInt( n -- )
;

.file "ex_e_5.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

outInt::
ret

inicio::

	call outInt

	halt
.end