; Enunciado:
;
; B5:	Fa�a uma rotina que escreva uma word na mem�ria.
;	Tome em aten��o que n�o pode alterar as posi��es de mem�ria cont�guas.
;	Na pilha, os par�metros de entrada e de sa�da s�o os apresentados na indica��o feita para refer�ncia � rotina:
;	ESCRW( word ender -- )
;

.file "exb6.s"
.org 0x1000        				; programa inicia-se no byte 0x1000
       	br inicio
.include "auxil.s"      		; defini��es auxiliares
;.include "biblioteca.s"	
n1::	.long	2
n2::	.long	3
n3:	.word	0
		
calc::
add 
ret

		; biblioteca de fun��es
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
