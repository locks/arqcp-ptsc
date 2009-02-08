; Enunciado:
;
; G5:	Faça uma rotina que determina o endereço dum elemento duma matriz de longs.
;	matrizes_endereco_elemento (end_m coluna linha -- endereco_elemento )
;
;	End = Base + (col * tam_el) - (linha * col * tam_el)
;	Endel = Base + (col + linha * col) * tam_el
;

.file "ex_g_5.s"
.include "auxil.s"
.include "biblioteca1.s"

.org 0x1000
	br inicio

matriz1::	.long 3,4,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1

matrizes_endereco_elemento::		; (end_m coluna linha -- endereco_elemento )
	pop lstack
	pop lstack
	pop lstack
	
	push r0
	inc #8
	add
	
	push r2
	call mymulu
	pop
	push #4
	call mymulu
	pop
	
	push r0
	add
	push r0
	ld []
	push #4
	call mymulu
	pop
	sub
	
	push r1
	push #4
	call mymulu
	pop
	add
	
	push lstack 
	pop
	push lstack 
	pop
	push lstack 
	pop
ret

inicio::
	push #matriz1
	push #1
	push #2
	call matrizes_endereco_elemento

	halt
.end
