; Enunciado:
;
; C2:	Fa�a uma rotina que lhe permita dividir um n�mero por 2 sem recurso � instru��o de divis�o.
;

.file "exc2.s"

.include "auxil.s"      		; defini��es auxiliares

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio

.include "biblioteca.s"			; biblioteca de fun��es

div2SemDivu::

		shr #1

		ret

	
inicio::

		push.n #4

		call div2SemDivu

        	halt
       		.end