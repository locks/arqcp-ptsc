; Enunciado:
;
; E7:	Desenvolva uma fun��o, que a partir de um valor escrito na mem�ria 
;	escreva esse valor no monitor na sua representa��o bin�ria.
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
