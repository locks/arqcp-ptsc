; Enunciado:
;
; C1:	Fa�a uma rotina que lhe permita multiplicar um n�mero por 2 sem recurso �s instru��es de multiplica��o.
;

.file "ex_c_1.s"
.include "auxil.s"
.include "biblioteca.s"

.org 0x1000
	br inicio

mul2SemMulu::
	shl #1
ret

inicio::
	push.l #3
	call mul2SemMulu

	halt
.end