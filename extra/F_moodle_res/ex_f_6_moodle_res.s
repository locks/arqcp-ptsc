; Enunciado:
;
; F6:	Desenvolva uma rotina que, dado o endere�o de in�cio do vector e o tamanho de cada elemento,
;	determine o endere�o de in�cio do elemento com determinado �ndice:
;	vectorElemento( end_v tam_e indice -- end_e )
;

.file "ex_f_6_moodle_res.s"
.include "auxil.s"
.include "mul_div.s"

.org 0x1000
	br inicio

vector:: .long 5,234223,4322,0,256543,456545

vectorElemento::			;( end_v tam_elem_bytes indice -- end_index )
							; se necess�rio comparar o valor do indice ao valor do tamanho do vector
							; para ver se existe esse elemento
	inc #1				;� necess�rio acrescentar um ao �ndice pois no �ndice 0 encontra-se o tamanho do vector
	call mymulu			;multiplicar o tamanho dos elementos pelo �ndice pretendido
	pop					;eliminar o primeiro long
	add					;adicionar o resultado ao endere�o
ret

inicio::
	push #vector		;vector
	push #4				;tamanho dos elementos
	push #0				;introduzir o �ndice pretendido numa base 0
	call vectorElemento
	ld []				;fazer o teste carregando o valor do indice pretendido
						;colocando-o no topo da stack

	push #vector		;vector
	push #4				;tamanho dos elementos
	push #4				;introduzir o �ndice pretendido numa base 0
	call vectorElemento
	ld []				;fazer o teste carregando o valor do indice pretendido
						;colocando-o no topo da stack

	push #vector		;vector
	push #4				;tamanho dos elementos
	push #3				;introduzir o �ndice pretendido numa base 0
	call vectorElemento
	ld []				;fazer o teste carregando o valor do indice pretendido
						;colocando-o no topo da stack

	halt
.end
