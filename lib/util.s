mymulu::
	push g0
	pop lstack
	pop g0
	push.l #0
	mulu
	push lstack
	pop g0

	ret


mymuls::

	push g0
	pop lstack
	pop g0
	push.l #0
	muls
	push lstack
	pop g0

	ret

mydivu::
	push g0
	pop lstack
	pop g0
	divu
	push lstack
	pop g0

	ret

escrb::
	push x
	pop lstack
	pop x
	ld [x]
	replb
	st [x]
	push lstack
	pop x

	ret

escrw::
	push x
	pop lstack
	pop x
	ld [x]
	replw
	st [x]
	push lstack
	pop x

	ret