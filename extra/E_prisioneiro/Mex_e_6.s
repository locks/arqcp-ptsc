; Enunciado:
;
; E6:	Desenvolva uma função, que leia um valor numérico do teclado (não ASCII!), escreva esse valor na memória.
;	inInt( n -- )
;

.file "ex_e_6.s"
.include "auxil.s"      		; definições auxiliares
.include "Biblioteca1.s"
.org 0x1000
        br inicio

n1:: .long 0

inInt2::
	pop g0
	push.n #0
	push g0

	loop2::
		push
		bz loop1_zero
		push.l #10
		call mydivu
		pop
		push.l #48
		add
		pop lstack	
		br loop2

	loop1_zero::
		push
		push.l #10
		call mydivu
		pop
		pop lstack
		push
		push.l #10
		call mydivu
		pop
		push.n #1
		add
		bz loop1

	ret


inInt::	
	push g2
	pop g2
	loop1::
		key
		push
		push.l #13
		sub
		bz loop1_fim
		push #48
		sub
		pop lstack
		push g2
		inc #1
		pop g2
		br loop1
		
	loop1_fim::
		; Falta ordenar os valores e atribuilos à variavel
		
	ret	


	
inicio::
	call inInt
	halt
	.end