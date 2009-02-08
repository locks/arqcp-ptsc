; arqcp
;
; rotina de ordenamento
;   a) com mxm
;   b) sem mxm
;
; ordenacres (n1 n2 n3 n4 -- 01 02 03 04)
;

.file "ordena.s"
.include "..\auxil.s"
.include "..\biblioteca.s"

.org 0x1000
	br inicio

n1:: .long #3
n2:  .long #5
n3:  .long #1
n4:  .long #4

compara::
	mxm
	rev
	mxm
ret

ordena::
	call compara
	pop lstack
	call compara
	push lstack
ret

inicio::
	push.l #n1
	ld []
	push.l #n2
	ld []
	push.l #n3
	ld []
	push.l #n4
	ld []

	call ordena

	halt
	.end