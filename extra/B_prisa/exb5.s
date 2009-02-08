; Enunciado:
;
; B5:	Fa�a uma rotina que escreva um byte na mem�ria.
;	Tome em aten��o que n�o pode alterar as posi��es de mem�ria cont�guas.
;	Na pilha, os par�metros de entrada e de sa�da s�o os apresentados na indica��o feita para refer�ncia � rotina:
;	ESCRB( byte ender -- )
;

.file "exb5.s"

.org 0x1000        				; programa inicia-se no byte 0x1000
        br inicio
.include "auxil.s"      		; defini��es auxiliares
	

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