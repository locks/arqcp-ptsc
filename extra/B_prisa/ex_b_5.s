; Enunciado:
;
; B5:	Faça uma rotina que escreva um byte na memória.
;	Tome em atenção que não pode alterar as posições de memória contíguas.
;	Na pilha, os parâmetros de entrada e de saída são os apresentados na indicação feita para referência à rotina:
;	ESCRB( byte ender -- )
;

.file "ex_b_5.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
        br inicio
.include "auxil.s"      		; definições auxiliares
					; biblioteca de funções
.include "biblioteca.s"

b1::	.byte 02
b2:	.byte 03
b3:	.byte 00

inicio::
	push.l #b1
	ld.b []
	push.l #b2
	ld.b []
	call mymulu
	pop
	push.l #b3
	call escrb
	

	push.l #b3
	ld[]
	replb
	halt
       	.end