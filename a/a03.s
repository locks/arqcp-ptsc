inicio::
	push.l #3
	push.l #2
	push.l #3
	push.l #5
	call ex_a_3

	halt
.end

a03::
	sub
	rev
	rev
	add
	xcg
	sub
ret
