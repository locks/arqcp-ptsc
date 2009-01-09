; Enunciado:
;
; C5:	Faça uma rotina que determine se um número de 32 bits sem sinal colocado em memória é ou não uma capicua em hexadecimal. Se sim a rotina deixa -1 no topo da stack; se não deixa 0 (zero).
;	CapicuaH(end_n1 -- n2)
;

.file "ex_c_5.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

CapicuaH::
ret

inicio::
	call CapicuaH

	halt
.end