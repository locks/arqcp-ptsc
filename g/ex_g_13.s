; Enunciado:
;
; G13:	Desenvolva uma fun��o, que a partir de uma matriz armazenada na mem�ria,
;	permita escrever essa matriz no monitor.
;	outMatriz(endM -- )
;

.file "ex_g_13.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

outMatriz::
ret

inicio::
	call outMatriz

	halt
.end
