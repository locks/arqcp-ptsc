; Enunciado:
;
; A15:	Fa�a uma rotina que fa�a a convers�o Metro/Cent�metro.
; 	Na pilha, os par�metros de entrada e de sa�da s�o os apresentados na indica��o feita para refer�ncia � rotina.
; 	mCm(n1 -- n2)
;

.file "ex_a_15.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
	br inicio
.include  "auxil.s"      		; defini��es auxiliares
.include  "UTIL.s"

mCm::				;  (n1 -- n2)

	push.l #100
	call mymulu
	pop
	ret

inicio::
	
	push.l #1 ; valor em metros para converter para centimetros
	call mCm

	halt
	.end