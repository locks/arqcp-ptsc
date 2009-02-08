; Enunciado:
;
; B7:	Fa�a uma rotina que partindo de 3 valores de 32 bits colocados em mem�ria, calcule o resultado da express�o matem�tica:
;	n4=(n1+n2)-(n1+n3).
;	Na pilha, os par�metros de entrada e de sa�da s�o os apresentados na indica��o feita para refer�ncia � rotina
;	F5(n1 n2 n3 -- n4)
;

.file "ex_b_7.s"

.include "auxil.s"      		; defini��es auxiliares

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio

.include "biblioteca.s"			; biblioteca de fun��es

n1: .long 4
n2: .long 3
n3: .long 2
n4: .long 0
F5::					; F5(n1 n2 n3 -- n3): n4=(n1+n2)-(n1+n3)

		add	
		push.l #n4
		st[]
		pop	
		push.l #n1
		ld[]
		push.l #n3
		ld[]
		add
		push.l #n4
		ld[]
		xcg		
		sub		
		pop
		ret

	
inicio::
		; F5: usar j� valores em vari�veis
		push.l #n1
		ld[]
		push.l #n2
		ld[]		
		call F5
        	halt
       		.end