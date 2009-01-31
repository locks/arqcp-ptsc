.include "a01.s"
.include "a02.s"
.include "a03.s"
.include "a04.s"
.include "a05.s"
.include "a06.s"
.include "a07.s"
.include "a08.s"
.include "a09.s"
.include "a10.s"
.include "a11.s"
.include "a12.s"
.include "a13.s"
.include "a14.s"
.include "a15.s"

a01::
	push.l #5
	push.l #4
	push.l #6
	call a01_ex
ret

a02::
	push.l #1
	push.l #2
	push.l #5
	call a02_ex
ret

a03::
	push.l #3
	push.l #2
	push.l #3
	push.l #5
	call a03_ex
ret

a04::
	push.l #3
	push.l #2
	call a04_ex
ret

a12::
	push.l #3
	push.l #2
	push.l #5
	push.l #4
	push
	push.l #1
	call a12_ex
ret

a13::
	push.l #50
	call celsiusFahrenheit
ret