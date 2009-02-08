; Enunciado:
;
; B5:	Faça uma rotina que escreva um byte na memória.
;	Tome em atenção que não pode alterar as posições de memória contíguas.
;	Na pilha, os parâmetros de entrada e de saída são os apresentados na indicação feita para referência à rotina:
;	ESCRB( byte ender -- )
;

.file "exb5.s"

.org 0x1000        				; programa inicia-se no byte 0x1000
        br inicio
.include "auxil.s"      		; definições auxiliares
	

n1::	.long	2
n2::	.long	3
n3::	.byte	0
	
calc::
add 
ret	

escrb::
	
	push	x
	pop		lstack
	pop		x
	ld 		[x]
	replb
	st 		[x]
	push	lstack
	pop		x
	ret	

inicio::
push.l #n1
ld []
push.l #n2
ld []
call calc
push.l #n3
call escrb 
						
halt
.end