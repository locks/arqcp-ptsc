; Enunciado:
;
; F9:	Desenvolva uma função que permita ler um vector do teclado,
;	sabendo que o terminar dessa introdução é reconhecido pela introdução de um caracter [CR] (Carriage return).
;	O seu armazenamento deve ser feito em memória, fazendo com que de seguida se guarde em memória também o tamanho do vector. 
;	inVector( endV -- )
;

.file "ex_f_9.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

inVector::
ret

inicio::
	call inVector

	halt
.end	