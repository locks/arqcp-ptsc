; Enunciado:
;
; E1:	Desenvolva uma rotina que permita ler um caracter [ASCII] do teclado e o deixe no topo da stack.
;	inCaracter( -- c)
;

.file "ex_e_1.s"

.org 0x1000
        br inicio
.include "auxil.s"      		; definições auxiliares


inCaracter::
		key

	ret
	
inicio::

	call inCaracter
	halt
	.end	