; Enunciado:
;
; C1:	Fa�a uma rotina que determine se um n�mero colocado em mem�ria � par ou �mpar.
;	Caso seja par dever� deixar zero no topo da stack; caso seja �mpar dever� deixar um.
;	ParOuImpar(n1 -- n2)
;

.file "exc3.s"

.include "auxil.s"      		; defini��es auxiliares

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio

.include "biblioteca.s"			; biblioteca de fun��es

ParOuImpar::
push.n #1
AND
		

		ret

	
inicio::
push.n #4
		

		call ParOuImpar

        	halt
       		.end