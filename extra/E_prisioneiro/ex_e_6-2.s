; Enunciado:
;
; E6:	Desenvolva uma função, que leia um valor numérico do teclado (não ASCII!), escreva esse valor na memória.
;	inInt( n -- )


.file "ex_e_6.s"
.org 0x1000       
br inicio
.include "auxil.s"      		
; definições auxiliares.


;int1: .b


.include "Biblioteca1.s"

inInt::	
	

	
	push.n #0
	pop lstack	
	
	ler::
		key
		push
		push.b #13
		xor
		bz fim
		push.b #0x30
		sub
		push r0
		add
		shl #4
		pop r0
		br ler
	
fim::
	pop
	push r0
	push lstack
	pop
	
					



ret



inicio::
	
call inInt	
halt
.end