; Enunciado: E7: Desenvolva uma fun��o, que a partir de um valor escrito na mem�ria 
;	escreva esse valor no monitor na sua representa��o bin�ria.
;	outBin( num -- )

.file "ex_e_7.s"

.org 0x1000        

br inicio

.include "auxil.s"      		; defini��es auxiliares

.include "biblioteca1.s"



n1:: .long 123


outBin::

	push ct
	pop lstack
	push #0
	pop ct
	ld []

outbin_loop::

	push #0
	push #2
	call mydivu
	xcg
	push
	push ct
	inc #1
	pop ct
	bz outbin_fim
	br outbin_loop
	
outbin_fim::

	pop

outbin_fim2::

	push #'0'
	add
	emit
	dbr outbin_fim2
	push lstack
	pop lstack

	ret






inicio::

	push #n1

	call outBin	

	halt	
	.end