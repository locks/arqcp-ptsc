; Enunciado:
;
; E1:	Desenvolva uma rotina que permita ler um caracter [ASCII] do teclado e o deixe no topo da stack.
;	inCaracter( -- c)
;

.file "ex_e_1.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

inCaracter::
ret

inicio::
	call inCaracter

	halt
.end	