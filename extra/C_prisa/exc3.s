; Enunciado:
;
; C1:	Faça uma rotina que determine se um número colocado em memória é par ou ímpar.
;	Caso seja par deverá deixar zero no topo da stack; caso seja ímpar deverá deixar um.
;	ParOuImpar(n1 -- n2)
;

.file "exc3.s"

.include "auxil.s"      		; definições auxiliares

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio

.include "biblioteca.s"			; biblioteca de funções

ParOuImpar::
push.n #1
AND
		

		ret

	
inicio::
push.n #4
		

		call ParOuImpar

        	halt
       		.end