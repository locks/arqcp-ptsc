; Enunciado:
;
; C5:	Fa�a uma rotina que determine se um n�mero de 32 bits sem sinal colocado em mem�ria 
;� ou n�o uma capicua em hexadecimal. Se sim a rotina deixa -1 no topo da stack
; se n�o deixa 0 (zero).
;	CapicuaH(end_n1 -- n2)
;

.file "ex_c_5.s"

.include "auxil.s"      		; defini��es auxiliares
.include "biblioteca.s"			; biblioteca de fun��es

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