; Enunciado:
;
; E3:	Desenvolva uma fun��o, que permita ler uma string do teclado, sabendo que o terminar dessa introdu��o � reconhecido pelo ASCII [CR] � Carriage return.
;	O seu armazenamento deve ser feito em mem�ria, terminando com o valor 0 (zero), e de seguida se guarde em mem�ria tamb�m o seu tamanho. 
;	inString( endS -- )
;

.file "ex_e_3.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

inString::
ret

inicio::

	call inString

	halt
.end	