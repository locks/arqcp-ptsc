; Enunciado:
;
; B3:	Faça uma rotina que partindo de valores de 32 bits, existentes na memória, se obtenha o resultado da sua multiplicação.
;	Utilize a rotina que desenvolveu em A7.
;

.file "exb3.s"


.org 0x1000        				; programa inicia-se no byte 0x1000
       	br inicio
		
.include "auxil.s"      		; definições auxiliares
.include "biblioteca.s"			; biblioteca de funções

n1::	.long	2
n2:	.long	3
n3:	.long	0
n4:	.long	0


F3::				; F3(n1 n2 -- n3): n3=(n1*n2)

	pop	g0      
            
        push.n 	#0
        muls
          
	ret

	
inicio::

push.b #2
push.b #3
call F3

push.l #n1
ld[]
push.l #n2
ld[]
call F3		

push.l #n3
st[]
push.l #n4
st[]

        	halt
       		.end