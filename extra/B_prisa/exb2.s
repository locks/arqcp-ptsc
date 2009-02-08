; Enunciado:
;
; B2:	Faça uma rotina que partindo de 3 valores de 32 bits, colocados em memória, se obtenha o resultado da seguinte expressão matemática: n3=(n1*n2).
;	Na pilha, os parâmetros de entrada e de saída são os apresentados na indicação feita para referência à rotina:
;	F2(n1 n2 -- n3 )
;

.file "exb2º.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
       	br inicio
.include "auxil.s"      		; definições auxiliares

.include "biblioteca.s"			; biblioteca de funções

n1::	.long	2
n2::	.long	3
n3::    .long   0

F2::				; F2(n1 n2 -- n3): n3=(n1*n2)
call mymulu


		ret		
		
inicio::

push.b #2
push.b #3
call F2

push.l #n1
ld[]
push.l #n2
ld[]
call F2
push.l #n3
st[]
halt
.end
