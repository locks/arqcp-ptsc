; Enunciado:
;
; B7:	Faça uma rotina que partindo de 3 valores de 32 bits colocados em memória, calcule o resultado da expressão matemática:
;	n4=(n1+n2)-(n1+n3).
;	Na pilha, os parâmetros de entrada e de saída são os apresentados na indicação feita para referência à rotina
;	F5(n1 n2 n3 -- n4)
;

.file "ex_b_7.s"


.org 0x1000        				; programa inicia-se no byte 0x1000
        br inicio
.include "auxil.s"      		; definições auxiliares
.include "biblioteca.s"			; biblioteca de funções

F5::					; F5(n1 n2 n3 -- n3): n4=(n1+n2)-(n1+n3)

		completar

		ret

	
inicio::
		; F5: usar já valores em variáveis

		completar

		call F5

        	halt
       		.end