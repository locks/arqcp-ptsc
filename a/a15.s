; Enunciado:
;
; A15:	Fa�a uma rotina que fa�a a convers�o Metro/Cent�metro.
; 	Na pilha, os par�metros de entrada e de sa�da s�o os apresentados na indica��o feita para refer�ncia � rotina.
; 	mCm(n1 -- n2)
;

.file "ex_a_15.s"
.include "../lib/auxil.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
	br inicio

mCm::				;  (n1 -- n2)
ret

inicio::

	call mCm

	halt
.end