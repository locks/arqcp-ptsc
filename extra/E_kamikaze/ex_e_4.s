; Enunciado:
;
; E4:	Desenvolva uma função, que a partir de uma string armazenada em memória que termina com o valor 0 (zero), escreva essa string no monitor.
;	outString(endS -- )
;

.file "ex_e_4.s"

.org 0x1000
        br inicio
.include "auxil.s"      		; definições auxiliares

str1::	.byte	"o prof de fisica ...!",0
outString::

	pop lstack

ciclo::	push r0
		ld.b []
		xcg
		pop
		push
		bz fim
		emit
		push r0
		inc #1
		pop r0
		br ciclo

fim::
	pop
	push lstack	
	pop
	push.b #'\n'
	emit	

	ret
	
inicio::
	push #str1
	call outString
	halt
	.end	