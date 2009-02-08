; Enunciado:
;
; B7:	Faça uma rotina que partindo de 3 valores de 32 bits colocados em memória, calcule o resultado da expressão matemática:
;	n4=(n1+n2)-(n1+n3).
;	Na pilha, os parâmetros de entrada e de saída são os apresentados na indicação feita para referência à rotina
;	F5(n1 n2 n3 -- n4)
;

.file "exb7.s"


.org 0x1000        				; programa inicia-se no byte 0x1000
        br inicio
.include "auxil.s"      		; definições auxiliares
.include "biblioteca.s"	
n1::	.long	2
n2::	.long	3
n3::	.long	1
n4::    .long   0		; biblioteca de funções

F5::
xcg		
rev
push
pop g0
add
xcg
push g0
add
sub

		ret

	
inicio::
		; F5: usar já valores em variáveis
push.l #n1
ld[]
push.l #n2
ld[]
push.l #n3
ld[]
call F5
push.l #n4
st[]

        	halt
       		.end