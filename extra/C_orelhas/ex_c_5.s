; Enunciado:
;
; C5:	Faça uma rotina que determine se um número de 32 bits sem sinal colocado em memória 
;é ou não uma capicua em hexadecimal. Se sim a rotina deixa -1 no topo da stack
; se não deixa 0 (zero).
;	CapicuaH(end_n1 -- n2)
;

.file "ex_c_5.s"

.include "auxil.s"      		; definições auxiliares
.include "biblioteca.s"			; biblioteca de funções

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio



CapicuaH::

		split
		push
		rev
		push
		pop lstack
		xcg
		pop lstack
		
		push.l #0x0000000F
		AND
		xcg
		push.l #0x0000F000
		AND
		shr #12
		sub
		
		
		push lstack
		push lstack
		push
		rev
		push
		pop lstack
		xcg
		pop lstack
		
		push.l #0x000000F0
		AND
		shr #4
		xcg
		push.l #0x00000F00
		AND
		shr #8
		sub

		push lstack
		push lstack
		push
		rev
		push
		pop lstack
		xcg
		pop lstack
		
		push.l #0x00000F00
		AND
		shr #8
		xcg
		push.l #0x000000F0
		AND
		shr #4
		sub

		push lstack
		push lstack
		push
		rev
		push
		pop lstack
		xcg
		pop lstack
		
		push.l #0x0000F000
		AND
		shr #12
		xcg
		push.l #0x0000000F
		AND
		sub
		
		


		ret

	




inicio::

		push.l #0xFFF00FFF

		call CapicuaH

        	halt
       		.end