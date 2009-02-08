; Enunciado:
;
; B3:	Faça uma rotina que partindo de valores de 32 bits, existentes na memória, se obtenha o resultado da sua multiplicação.
;	Utilize a rotina que desenvolveu em A7.
;

.file "ex_b_3.s"

.include "auxil.s"      		; definições auxiliares

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        	br inicio

		; biblioteca de funções

n1::	.long	2
n2:	.long	3
n3:	.long	0
n4:	.long	0


F3::				; F3(n1 n2 -- n3): n3=(n1*n2)

		push g0
		pop lstack
		pop g0
		push.n #0
		mulu
		push lstack
		pop g0	

		ret

	
inicio::
		; F3: usar já valores em variáveis

		push.l #n1
		ld[]
		push.l #n2
		ld[]		
		call F3
		push.l #n4
		st[]
		pop
		push.l #n3
		st[]
		pop						
        	halt
       		.end