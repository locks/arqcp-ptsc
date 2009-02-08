.file "mylib.s"

mymulu::
	push g0
	pop lstack
	pop g0
	push.n #0
	mulu
	pop
	push lstack
	pop g0
	
	ret
mymuls::
	push g0
	pop lstack
	pop g0
	push.n #0
	mulu
	pop
	push lstack
	pop g0
	
	ret

mydivu::
	push g0
	pop lstack
	pop g0
	push.n #0
	divu
	push lstack
	pop g0
	
	ret

.end