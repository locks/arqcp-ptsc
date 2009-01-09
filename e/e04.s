; Enunciado:
;
; E4:	Desenvolva uma função, que a partir de uma string armazenada em memória que termina com o valor 0 (zero), escreva essa string no monitor.
;	outString(endS -- )
;

.file "ex_e_4.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

outString::
ret

inicio::

	call outString

	halt
.end	