; Enunciado:
;
; C2:	Faça uma rotina que lhe permita dividir um número por 2 sem recurso à instrução de divisão.
;

.file "ex_c_2.s"
.include "auxil.s"
.include "biblioteca.s"

.org 0x1000
	br inicio

div2SemDivu::
	shr #1
ret

inicio::
	push.l #4
	call div2SemDivu
	
	halt
.end
