; Enunciado:
;
; B7:	Fa�a uma rotina que partindo de 3 valores de 32 bits colocados em mem�ria, calcule o resultado da express�o matem�tica:
;	n4=(n1+n2)-(n1+n3).
;	Na pilha, os par�metros de entrada e de sa�da s�o os apresentados na indica��o feita para refer�ncia � rotina
;	F5(n1 n2 n3 -- n4)
;

.file "ex_b_7.s"


.org 0x1000        				; programa inicia-se no byte 0x1000
        br inicio
.include "auxil.s"      		; defini��es auxiliares
.include "biblioteca.s"			; biblioteca de fun��es

F5::					; F5(n1 n2 n3 -- n3): n4=(n1+n2)-(n1+n3)

		completar

		ret

	
inicio::
		; F5: usar j� valores em vari�veis

		completar

		call F5

        	halt
       		.end