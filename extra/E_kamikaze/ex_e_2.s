; Enunciado:
;
; E2:	Desenvolva uma rotina que permita escrever um caracter [ASCII] no monitor, estando esse caracter no topo da stack. 
;	outCaracter( c -- )
;

.file "ex_e_2.s"

.org 0x1000
        br inicio
.include "auxil.s"      		; definições auxiliares



outInt::

	emit

	ret
	
inicio::
	push #49
	call outInt
	halt
	.end	