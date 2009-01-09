; Enunciado:
;
; F3:	Desenvolva uma rotina que, dado o endereço de início do vector e o tamanho de cada elemento,
;	determine o número de bytes que o vector ocupa em memória:
;	vectorTam(end_v tam_e -- n)
;

.file "ex_f_3.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

vector:: .long 5,234223,4322,0,256543,456545

vectorTam::
ret

inicio::
	call vectorTam

	halt
.end
