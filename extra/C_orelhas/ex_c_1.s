; Enunciado:
;
; C1:	Fa�a uma rotina que lhe permita multiplicar um n�mero por 2 sem recurso �s instru��es de multiplica��o.
;

.file "ex_c_1.s"

.include "auxil.s"      		; defini��es auxiliares

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio

.include "biblioteca.s"			; biblioteca de fun��es

mul2SemMulu::

		shl #1	

		ret

	
inicio::

		push.b #5

		call mul2SemMulu

        	halt
       		.end
