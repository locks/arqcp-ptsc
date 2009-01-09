; Enunciado:
;
; E2:	Desenvolva uma rotina que permita escrever um caracter [ASCII] no monitor, estando esse caracter no topo da stack. 
;	outCaracter( c -- )
;

.file "ex_e_2.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

outInt::
ret

inicio::

	call outInt

	halt
.end	