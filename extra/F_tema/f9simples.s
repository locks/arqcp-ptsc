; Enunciado:
;
; F9:	Desenvolva uma fun��o que permita ler um vector do teclado,
;	sabendo que o terminar dessa introdu��o � reconhecido pela introdu��o de um caracter [CR] (Carriage return).
;	O seu armazenamento deve ser feito em mem�ria, fazendo com que de seguida se guarde em mem�ria tamb�m o tamanho do vector. 
;	inVector( endV -- )
;

.file "ex_f_9.s"
.include "auxil.s"
.include "biblioteca1.s"

.org 0x1000
	br inicio

vec::	.long 0
len::	.long 0

inVector::
	push #0
	pop lstack
	pop lstack
	loop::
		key
		push
		push 
		emit 
		push #13
		bz fim

		push r0
		inc #1
		pop r0
		push r1
		inc #1
		pop r1
		br loop

fim::
	push lstack 
	pop
	push lstack
	st []
	pop
ret

inicio::
	push #vec
	call inVector

	halt
.end	