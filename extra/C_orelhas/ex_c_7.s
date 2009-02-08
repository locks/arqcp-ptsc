; Enunciado:
;
; C7:	Faça uma rotina que determine se um número de 16 bits sem sinal colocado em memória é uma potência de 2 (dois). Se sim a rotina deixa 0 (zero) no topo da stack; se não deixa -1.
;	Pot2(end_n1 – n2)
;

.file "ex_c_7.s"

.include "auxil.s"      		; definições auxiliares

.org 0x1000        			; programa inicia-se no byte 512 = 0x200

        br inicio

;.include "biblioteca.s"			; biblioteca de funções

Pot2::
	SC_LOOP::
		push
		rev
		push
		rev
		xor
		push
		bz SC_FIM
		xcg
		shl #1
		dbr SC_LOOP
		pop
		pop
		push.l #-1
		ret
	SC_FIM::
		push.l #0
		
		ret

	
inicio::
	push.l #16
	push ct
	pop lstack
	pop ct
	push.l #4
	push.l #1
	call Pot2
        	halt
       		.end
