; Enunciado:
;
; F9:	Desenvolva uma função que permita ler um vector do teclado,
;	sabendo que o terminar dessa introdução é reconhecido pela introdução de um caracter [CR] (Carriage return).
;	O seu armazenamento deve ser feito em memória, fazendo com que de seguida se guarde em memória também o tamanho do vector. 
;	inVector( endV -- )
;

.file "ex_f_9.s"
.include "auxil.s"      		; definições auxiliares
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