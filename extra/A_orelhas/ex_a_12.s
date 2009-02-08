; Enunciado:
;
; A12:	Faça uma rotina que calcule o resultado da operação (3+2)/(5+4)/(4-1)
;

.file "ex_a_12.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
	br inicio
.include  "auxil.s"      		; definições auxiliares
.include  "UTIL.s"


inicio::
	push.l #3
	push.l #2
	add
	push.l #5
	push.l #4
	add
	push.l #0
	xcg
	call mydivu
	pop
	push.l #4
	push.l #1
	sub
	push.l #0
	xcg
	call mydivu
	pop
	halt
	.end