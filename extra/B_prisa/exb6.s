; Enunciado:
;
; B5:	Faça uma rotina que escreva uma word na memória.
;	Tome em atenção que não pode alterar as posições de memória contíguas.
;	Na pilha, os parâmetros de entrada e de saída são os apresentados na indicação feita para referência à rotina:
;	ESCRW( word ender -- )
;

.file "exb6.s"
.org 0x1000        				; programa inicia-se no byte 0x1000
       	br inicio
.include "auxil.s"      		; definições auxiliares
;.include "biblioteca.s"	
n1::	.long	2
n2::	.long	3
n3:	.word	0
		
calc::
add 
ret

		; biblioteca de funções
escrw::
					;escrw (word addr -- )
	push x
	pop lstack
	pop x
	ld [x]
	replw
	st [x]
	push lstack
	pop x
	ret		

inicio::
push.l #n1
ld[]
push.l #n2
ld[]

call calc
push.l #n3
call escrw

halt
.end
