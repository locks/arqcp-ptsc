; Enunciado:
;
; D5:	Faça uma rotina que permita detectar se duas strings colocadas em memória são iguais.
;	Caso sejam deverá deixar -1 no topo da stack; caso não sejam deverá deixar 0 (zero).
;	Iguais(end_s1 end_s2 -- n1)
;

.file "ex_d_5.s"
.include "auxil.s"      		; definições auxiliares
.include "biblioteca.s"			; biblioteca de funções
.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio

st1: .byte "Uma 1",0
st2: .byte "Uma 1",0


Iguais::
		push.l #0
		pop lstack
		pop lstack
		pop lstack
		
		iguais_loop::
			push r0
			ld.b []
			push r1
			ld.b []
			xor
			bz iguais_cont
			push.n #-1
			br final

		iguais_cont::
			push 	r0
			ld.b	[]
			push
			bz final

			pop
			push r0
			inc #1
			pop r0

			push r1
			inc #1
			pop r1
			
			br iguais_loop		

		final::
			eqz
			push lstack
			pop
			push lstack
			pop
			push lstack
			pop		
		ret

	
inicio::
		push.l #st1
		push.l #st2

		call Iguais

        	halt
       		.end