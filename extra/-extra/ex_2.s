; ARQCP
; MINI-TESTE, EXERCICIO 2
;
; n1=n2*2=n3*4
;

.file "ex_2"
.include "auxil.s"

.org 0x1000
	br main

rotina::
	shl #2
	push
	rev
	shl #1
	sub
	rev
	rev
	sub
	or
	eqz
	
	ret

main::
	push.l #4 ; n1
	push.l #2 ; n2
    push.l #1 ; n3
	call rotina

	halt
	.end