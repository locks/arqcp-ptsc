; Enunciado:
;
; E7:	Desenvolva uma função, que a partir de um valor escrito na memória 
;	escreva esse valor no monitor na sua representação binária.
;	outBin( num -- )
;

.file "ex_e_7.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

outBin::
ret

inicio::

	call outBin

	halt
.end
