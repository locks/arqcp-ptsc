; Enunciado:
;
; E5:	Desenvolva uma função, que a partir de um valor escrito na memória (não ASCII!), 
;	escreva esse valor como um valor numérico inteiro no monitor.
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