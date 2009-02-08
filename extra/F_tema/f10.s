; Enunciado:
;
; F10:	Desenvolva uma função, que a partir de um vector de elementos armazenado na memória,
;	e sabendo quantos são elementos tem o vector (num_V), permita escrever esse vector no monitor.
;	outVector(endV num_V-- )
;

.file "ex_f_10.s"

.org 0x1000
        br inicio
		
.include "auxil.s"      		; definições auxiliares
.include "biblioteca4.s"
.include "biblioteca1.s"

vec:: .long 10,4,3
len:: .long 3

outVector::
		push ct 
		pop lstack
		pop ct
		pop lstack
	loop1::
		push r0
		ld []
		call io_printLong
		push.b #','
		emit
		push r0
		inc #4
		pop r0
		dbr loop1
		push lstack
		pop
		push lstack
		pop ct
		ret
	
	
inicio::
	push #vec
	push #len
	ld []
	call outVector
	halt
	.end