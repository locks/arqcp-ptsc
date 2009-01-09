; Enunciado:
;
; A15:	Faça uma rotina que faça a conversão Metro/Centímetro.
; 	Na pilha, os parâmetros de entrada e de saída são os apresentados na indicação feita para referência à rotina.
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