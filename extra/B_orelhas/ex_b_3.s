; Enunciado:
;
; B3:	Fa�a uma rotina que partindo de valores de 32 bits, existentes na mem�ria, se obtenha o resultado da sua multiplica��o.
;	Utilize a rotina que desenvolveu em A7.
;

.file "ex_b_3.s"

.include "auxil.s"      		; defini��es auxiliares

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        	br inicio

		; biblioteca de fun��es

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
		; F3: usar j� valores em vari�veis

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