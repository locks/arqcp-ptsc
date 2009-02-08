; Enunciado:
;
; B2:	Fa�a uma rotina que partindo de 3 valores de 32 bits, colocados em mem�ria, se obtenha o resultado da seguinte express�o matem�tica: n3=(n1*n2).
;	Na pilha, os par�metros de entrada e de sa�da s�o os apresentados na indica��o feita para refer�ncia � rotina:
;	F2(n1 n2 -- n3 )
;

.file "exb2�.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
       	br inicio
.include "auxil.s"      		; defini��es auxiliares

.include "biblioteca.s"			; biblioteca de fun��es

n1::	.long	2
n2::	.long	3
n3::    .long   0

F2::				; F2(n1 n2 -- n3): n3=(n1*n2)
call mymulu


		ret		
		
inicio::

push.b #2
push.b #3
call F2

push.l #n1
ld[]
push.l #n2
ld[]
call F2
push.l #n3
st[]
halt
.end
