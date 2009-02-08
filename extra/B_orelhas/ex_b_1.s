; Enunciado:
;
; B1:	Faça uma rotina que partindo de 3 valores de 32 bits, colocados em memória, se obtenha o resultado da seguinte expressão matemática: 
;	n4=n1+n2-n3; Na pilha, os parâmetros de entrada e de saída são os apresentados na indicação feita para referência à rotina:
;	F1(n1 n2 n3 -- n4)
;

.file "ex_b_1.s"
.org 0x1000        			; programa inicia-se no byte 0x1000
       	br inicio
.include  "auxil.s"      		; definições auxiliares


n1:	.long	2
n2:	.long	3
n3:	.long	4

F1::				; F1(n1 n2 n3 – n4): n4=n1+n2-n3

		sub
		add		
		ret


inicio::
		; F1: inicialmente com constantes (longs)

		push.n #2
		push.n #3
		push.n #4	

		call F1

		; F1: depois com variáveis (longs)
		
		pop
		push.l #n1
		ld[]		
		push.l #n2
		ld[]
		push.l #n3
		ld[]

		call F1

        	halt
       		.end
