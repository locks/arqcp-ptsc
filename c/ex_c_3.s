; Enunciado:
;
; C1:	Fa�a uma rotina que determine se um n�mero colocado em mem�ria � par ou �mpar.
;	Caso seja par dever� deixar zero no topo da stack; caso seja �mpar dever� deixar um.
;	ParOuImpar(n1 -- n2)
;

.file "ex_c_3.s"
.include "auxil.s"
.include "biblioteca.s"

.org 0x1000
	br inicio

PauOuImpar::
	
ret

inicio::
	push.l #5
	call ParOuImpar
	
	halt
.end