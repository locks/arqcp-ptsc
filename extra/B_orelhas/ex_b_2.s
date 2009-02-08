; Enunciado:
;
; B2:	Faça uma rotina que partindo de 3 valores de 32 bits, colocados em memória, se obtenha o resultado da seguinte expressão matemática: n3=(n1*n2).
;	Na pilha, os parâmetros de entrada e de saída são os apresentados na indicação feita para referência à rotina:
;	F2(n1 n2 -- n3 )
;

.file "ex_b_2.s"

.include "auxil.s"      		; definições auxiliares

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        	br inicio

		; biblioteca de funções

n1::	.long	2
n2:	.long	3
n3:	.long	0

F2::				; F2(n1 n2 -- n3): n3=(n1*n2)

		push g0
		pop lstack
		pop g0
		push.n #0
		mulu
		push lstack
		pop g0		

		ret		
		
inicio::
		; F2: inicialmente com constantes (longs)

		push.n #2
		push.n #3
		call F2

		; F2: depois com variáveis

		pop
		pop

		push.l #n1
		ld[]
		push.l #n2
		ld[]
		call F2
		push.l #n3
		st[]
        	halt
       		.end
