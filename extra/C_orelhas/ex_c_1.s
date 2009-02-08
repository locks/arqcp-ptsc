; Enunciado:
;
; C1:	Faça uma rotina que lhe permita multiplicar um número por 2 sem recurso às instruções de multiplicação.
;

.file "ex_c_1.s"

.include "auxil.s"      		; definições auxiliares

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio

.include "biblioteca.s"			; biblioteca de funções

mul2SemMulu::

		shl #1	

		ret

	
inicio::

		push.b #5

		call mul2SemMulu

        	halt
       		.end
