; Enunciado:
;
; F5:	Dado um vector de números de 32 bits, e sabendo o seu tamanho, faça uma rotina que determine o maior dos seus elementos.
; 	Maior_V ( ender len_v -- maior )
;

.file "ex_f_5.s"
.include "auxil.s"

.org 0x1000
	br inicio

vector:: .long 12,23,2,0,23,45

Maior_V::
	push ct 
	pop lstack
	pop ct
	
	pop lstack
    ld[r0++]
	dec ct, #1

	loop::
		ld[r0++]
		mxm
		xcg
		pop
	dbr loop

	push lstack
	pop
	push lstack
	pop ct	
ret

inicio::
	push #vector
	push #6
	call Maior_V

	halt
.end
