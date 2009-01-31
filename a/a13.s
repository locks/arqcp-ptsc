celsiusFahrenheit::
	push.l #32
	sub
	push.l #5
	push.l #0
	push.l #9
	call mydivu
	pop
	call mymulu
	pop
ret
