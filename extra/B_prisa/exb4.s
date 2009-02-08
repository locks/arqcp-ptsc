; Enunciado:
;
; B4:	Fa�a uma rotina que partindo de valores de 32 bits, existentes na mem�ria, se obtenha o resultado da sua divis�o.
;	Utilize a rotina que desenvolveu em A11.
;

.file "exb4.s"


.org 0x1000        				; programa inicia-se no byte 0x1000
       	br inicio
.include "auxil.s"      		; defini��es auxiliares
.include "biblioteca.s"			; biblioteca de fun��es

n1::	.long	2
n2::	.long	3
n3::	.long	0


F4::					; F4(n1 n2 -- n3): n3=(n1/n2)

	pop g0 
	push.n #0
	divu 	
	ret

	
inicio::
push.b #2
push.b #3
call F4

push.l #n1
ld[]
push.l #n2
ld[]
call F4
push.l #n3
st[]
pop
halt
.end