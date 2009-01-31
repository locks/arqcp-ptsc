;
; TOC
;
; 1. mymuls
;

mymuls::
	push g0
	pop lstack
	pop g0
	push.l #0
	muls
	push lstack
	pop g0
ret