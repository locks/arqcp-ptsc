; Enunciado:
;
; F9:	Desenvolva uma fun��o que permita ler um vector do teclado,
;	sabendo que o terminar dessa introdu��o � reconhecido pela introdu��o de um caracter [CR] (Carriage return).
;	O seu armazenamento deve ser feito em mem�ria, fazendo com que de seguida se guarde em mem�ria tamb�m o tamanho do vector. 
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