; Enunciado:
;
; D5:	Fa�a uma rotina que permita detectar se duas strings colocadas em mem�ria s�o iguais.
;	Caso sejam dever� deixar -1 no topo da stack; caso n�o sejam dever� deixar 0 (zero).
;	Iguais(end_s1 end_s2 -- n1)
;

.file "ex_d_5.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

Iguais::
ret

inicio::
	call Iguais

	halt
.end