; Enunciado:
;
; F4:	Dado um vector de n�meros de 32 bits fa�a uma rotina que fa�a a soma de todos os seus elementos, sabendo o tamanho do vector.
;	Soma_V_L(end1 len_v1 -- n)
;

.file "ex_f_4.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

vector:: .long 12,23,2,0,23,45

Soma_V_L::
ret

inicio::
	call Soma_V_L

	halt
.end
