; Enunciado:
;
; A7:	Fa�a uma rotina que calcule o resultado da opera��o (3+2)*(5+4)*(4-1)
;

.file "ex_a_8.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
        br inicio
.include  "auxil.s"      		; defini��es auxiliares
.include  "UTIL.s"



inicio::
	push.l #3
	push.l #2
	add
	push.l #5
	push.l #4
	add
	call mymulu
	pop
	push.l #4
	push.l #1
	sub
	call mymulu

		halt
		.end