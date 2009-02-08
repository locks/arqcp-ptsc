; Enunciado: E6:	Desenvolva uma função, que leia um valor numérico do teclado (não ASCII!), 
;escreva esse valor na memória

;inInt( n -- )

.file "ex_e_6.s"

.org 0x1000     

br inicio

.include "auxil.s"      		; definições auxiliares

.include "biblioteca1.s"

n1:: .space.b 6


inInt::	

	push ct
	pop lstack
	dec #1
	pop ct
	pop lstack
	push #0
	pop lstack

inint_loop::

	key
	push
	push #13
	xor
	bz inint_fim
	push r0
	inc #1
	pop r0
	dbr inint_loop
	br inint_fim2

inint_fim2::

	push lstack
	pop ct
	push #0
	pop lstack
	push #1
	pop lstack
	br inint_loop2

inint_fim::
	
	pop
	push lstack
	pop ct
	push #0
	pop lstack
	push #1
	pop lstack

inint_loop2::	
		
	push #'0'
	sub
	push r0
	call mymulu
	pop
	push r1
	add
	push r0
	push #10
	call mymulu
	pop
	pop r0
	pop r1
	dbr inint_loop2
	push lstack
	pop
	push lstack
	push lstack
	push lstack
	pop ct
	st []
	
	ret

inicio::	

	push #n1
	push #6

	call inInt

	halt	
	.end
