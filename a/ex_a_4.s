; Enunciado:
;
; A4:	Fa�a uma rotina que calcule o resultado da opera��o 3*2
;

.file "ex_a_4.s"
.include "auxil.s"

.org 0x1000
	br inicio

ex_a_4::				; 3*2 -> 3 2 *

ret

inicio::
	call ex_a_4

	halt
.end