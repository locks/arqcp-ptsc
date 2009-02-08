; Enunciado:
;
; C2:	Faça uma rotina que lhe permita dividir um número por 2 sem recurso à instrução de divisão.
;

.file "ex_c_2.s"

.include "auxil.s"      		; definições auxiliares

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio

.include "biblioteca.s"			; biblioteca de funções

div2SemDivu::

		shr #1

		ret

	
inicio::

		push.b #7

		call div2SemDivu

        	halt
       		.end
