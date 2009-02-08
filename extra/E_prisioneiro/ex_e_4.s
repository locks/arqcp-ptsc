; Enunciado:
; E4:	Desenvolva uma função, que a partir de uma string armazenada em memória que termina com o valor 0 (zero),
;escreva essa string no monitor
;outString(endS -- )
;file "ex_e_4.s"
.org 0x1000
br inicio
.include "auxil.s"
; definições auxiliares
.include "Biblioteca1.s"
str1: .byte"ze nome de campeao",0
outString::
	pop lstack
out::
	push r0
	ld.b []
	push
	bz fim
	emit
	push r0
	inc #1
	pop r0
	br out



fim::
	
	ret

inicio::
push.l #str1
call outString
halt
.end	