; Enunciado:
;
; B4:	Faça uma rotina que partindo de valores de 32 bits, existentes na memória, se obtenha o resultado da sua divisão.
;	Utilize a rotina que desenvolveu em A11.
;

.file "ex_b_4.s"

.include "auxil.s"      		; definições auxiliares

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        	br inicio

			; biblioteca de funções

n1::	.long	2
n2:	.long	3
n3:	.long	0


F4::					; F4(n1 n2 -- n3): n3=(n1/n2)

		push g0
		pop lstack
		pop g0
		push.n #0
		divu
		push lstack
		pop g0	

		ret

	
inicio::
		; F4: usar já valores em variáveis

		push.l #n1
		push.l #n2	
		call F4
		pop
		push.l #n3
		st[]
		pop
        	halt
       		.end