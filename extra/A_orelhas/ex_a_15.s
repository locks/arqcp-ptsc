; Enunciado:
;
; A15:	Faça uma rotina que faça a conversão Metro/Centímetro.
; 	Na pilha, os parâmetros de entrada e de saída são os apresentados na indicação feita para referência à rotina.
; 	mCm(n1 -- n2)
;

.file "ex_a_15.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
	br inicio
.include  "auxil.s"      		; definições auxiliares
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