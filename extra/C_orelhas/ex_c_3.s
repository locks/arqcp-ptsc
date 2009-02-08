; Enunciado:
;
; C1:	Faça uma rotina que determine se um número colocado em memória é par ou ímpar.
;	Caso seja par deverá deixar zero no topo da stack

; caso seja ímpar deverá deixar um.
;	ParOuImpar(n1 -- n2)
;

.file "ex_c_1.s"

.include "auxil.s"      		; definições auxiliares

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio

.include "biblioteca.s"			; biblioteca de funções

ParOuImpar::


		push.l #1
		AND
			
		ret

	
inicio::

		push.l #11
		push

		call ParOuImpar

        	halt
       		.end