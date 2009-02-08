; Enunciado:
;
; F4:	Dado um vector de números de 32 bits faça uma rotina que faça a soma de todos os seus elementos, sabendo o tamanho do vector.
;	Soma_V_L(end1 len_v1 -- n)
;

.file "ex_f_4.s"
.include "auxil.s"

.org 0x1000
	br inicio

vector:: .long 12,23,2,0,23,45

Soma_V_L::
	push ct
	pop lstack
	pop ct
	pop lstack
	push #0
	loop::
		push r0
		ld[]
		add
		push r0
		inc #4
		pop r0
		dbr loop
		push lstack
		pop
		push lstack 
		pop ct
ret

	
inicio::
	push #vector
	push #6
	call Soma_V_L

	halt
.end
