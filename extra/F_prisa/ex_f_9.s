; Enunciado:
;
; F9:	Desenvolva uma fun��o que permita ler um vector do teclado,
;	sabendo que o terminar dessa introdu��o � reconhecido pela introdu��o de um caracter [CR] (Carriage return).
;	O seu armazenamento deve ser feito em mem�ria, fazendo com que de seguida se guarde em mem�ria tamb�m o tamanho do vector. 
;	inVector( endV -- )
;

.file "ex_f_9.s"
.include "auxil.s"      		; defini��es auxiliares
;.include "biblioteca.s"

vec:: .space.l 20
.org 0x1000
        br inicio


inVector::
	push ct
	pop ct

	loop::
		pop lstack
		
		loop_key::
				key
		
		
		push
		push.l #13
		sub
		bz fim
		push.l #48
		add
		push lstack
		st[]
		push ct
		inc #1
		pop ct
		push lstack
		inc #4
		pop lstack
		pop
		br inVector
	fim::
		push lstack
		pop
		
		
	

	ret
	
inicio::
	
	push.l #vec

	call inVector
	halt
	.end	