; Enunciado: 
; E5:	Desenvolva uma função, que a partir de um valor escrito na memória (não ASCII!), 
;	escreva esse valor como um valor numérico inteiro no monitor.
;	outInt( n -- )



.file "ex_e_5.s"
.org 0x1000        
br inicio
.include "auxil.s"      		

.include "biblioteca1.s"



n1:: .long 123456


outInt::
	push ct
	pop lstack	
	push.n #0
	pop lstack
io_outInt_loop::
	push.n #0
	push.b #10
	call mydivu
	xcg
	push
		
	push r0
	inc #1
	pop r0
	bz io_outInt_fim
	br io_outInt_loop
io_outInt_fim::
	pop
	push lstack
	pop ct

io_outInt_loop1::
	push.b #'0'	
	add
	emit
	dbr io_outInt_loop1
	push lstack
	pop ct
	ret
	

inicio::
	push.l #n1
	ld[]
	call outInt
	halt
	.end	