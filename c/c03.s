; Enunciado:
;
; C1:	Faça uma rotina que determine se um número colocado em memória é par ou ímpar.
;	Caso seja par deverá deixar zero no topo da stack; caso seja ímpar deverá deixar um.
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