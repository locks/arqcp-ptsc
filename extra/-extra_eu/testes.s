.file "testes.s"
.include "auxil.s"
.include "util.s"

.org 0x1000
	br main

n1:: .long #0xFFFF

rotina::
	push.l #0xFFFF0000
	and
	push #7
	bz menor_igual
	push #0
	ret

menor_igual::
	push #-1
	ret

teste:: .byte #5

main::
	push #teste
	ld.b []
	shl #4
	
	
	push #0xFFFF
	shl #16
	
	halt
	.end