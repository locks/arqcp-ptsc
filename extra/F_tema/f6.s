; Enunciado:
;
; F6:	Desenvolva uma rotina que, dado o endereço de início do vector e o tamanho de cada elemento,
;	determine o endereço de início do elemento com determinado índice:
;	vectorElemento( end_v tam_e indice -- end_e )
;

.file "ex_f_6.s"
.include "auxil.s"
.include "biblioteca1.s"

.org 0x1000
	br inicio

vector:: .long 5,234223,4322,0,256543,456545
indice:: .long 2

vectorElemento::
	call mymulu
	pop
	add	
ret

inicio::
	push #vector
	push #4
	push #indice
	ld[]
	call vectorElemento

	halt
.end
