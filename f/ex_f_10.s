; Enunciado:
;
; F10:	Desenvolva uma fun��o, que a partir de um vector de elementos armazenado na mem�ria,
;	e sabendo quantos s�o elementos tem o vector (num_V), permita escrever esse vector no monitor.
;	outVector(endV num_V-- )
;

.file "ex_f_10.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

outVector::
ret