; Enunciado:
;
; C2:	Fa�a uma rotina que lhe permita dividir um n�mero por 2 sem recurso � instru��o de divis�o.
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
