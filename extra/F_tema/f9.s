; Enunciado:
;
; F9:	Desenvolva uma fun��o que permita ler um vector do teclado,
;	sabendo que o terminar dessa introdu��o � reconhecido pela introdu��o de um caracter [CR] (Carriage return).
;	O seu armazenamento deve ser feito em mem�ria, fazendo com que de seguida se guarde em mem�ria tamb�m o tamanho do vector. 
;	inVector( endV -- )
;

.file "ex_f_9.s"

.org 0x1000
        br inicio
		
.include "auxil.s"      		; defini��es auxiliares
.include "biblioteca1.s"
.include "biblioteca4.s"

vector::	.long	0
len:: .long 0

inVector::
	push.n #0
	pop lstack
	pop lstack
	loop::
		key
		push
		push #13
		sub
		bz prox
		call io_readLong
		push r1
		inc #1
		pop r1
		br loop
		

prox::
	pop
	push r0
	inc#4
	pop r0			
	key
	push.b #13
	sub
	bz fim
	br loop
	
fim::
	push lstack
	pop
	push lstack
	push #len
	st[]
	pop
	ret
	
inicio::

	push #vector
	call inVector
	halt
	.end	