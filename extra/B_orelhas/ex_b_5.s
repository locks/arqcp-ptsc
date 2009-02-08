; Enunciado:
;
; B5:	Faça uma rotina que escreva um byte na memória.
;	Tome em atenção que não pode alterar as posições de memória contíguas.
;	Na pilha, os parâmetros de entrada e de saída são os apresentados na indicação feita para referência à rotina:
;	ESCRB( byte ender -- )
;

.file "ex_b_5.s"

.org 0x1000        				; programa inicia-se no byte 0x1000
        br inicio
.include "auxil.s"      		; definições auxiliares
.include "biblioteca.s"			; biblioteca de funções

b1: .byte 0

escrb::	Push x
	pop lstack
	pop x
	lp[x]				;escrb (byte addr -- )
	repl b1				;desc:	escreve um byte na memória 
	st[x]				;input:
	push lstack				;	byte: o byte a guardar
	pop x				;	addr: o endereço a guardar o byte
	ret	
inicio::
	push.n #0
	push.l #b1
	call escrb
	halt
	.end