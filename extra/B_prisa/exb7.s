; Enunciado:
;
; B7:	Fa�a uma rotina que partindo de 3 valores de 32 bits colocados em mem�ria, calcule o resultado da express�o matem�tica:
;	n4=(n1+n2)-(n1+n3).
;	Na pilha, os par�metros de entrada e de sa�da s�o os apresentados na indica��o feita para refer�ncia � rotina
;	F5(n1 n2 n3 -- n4)
;

.file "exb7.s"


.org 0x1000        				; programa inicia-se no byte 0x1000
        br inicio
.include "auxil.s"      		; defini��es auxiliares
.include "biblioteca.s"	
n1::	.long	2
n2::	.long	3
n3::	.long	1
n4::    .long   0		; biblioteca de fun��es

F5::
xcg		
rev
push
pop g0
add
xcg
push g0
add
sub

		ret

	
inicio::
		; F5: usar j� valores em vari�veis
push.l #n1
ld[]
push.l #n2
ld[]
push.l #n3
ld[]
call F5
push.l #n4
st[]

        	halt
       		.end