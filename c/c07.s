; Enunciado:
;
; C7:	Faça uma rotina que determine se um número de 16 bits sem sinal colocado em memória é uma potência de 2 (dois). Se sim a rotina deixa 0 (zero) no topo da stack; se não deixa -1.
;	Pot2(end_n1 – n2)
;

.file "ex_c_7.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

var:: .long 32

Pot2::
	ld []
ret

inicio::
	push.n #var
	call Pot2

	halt
.end
