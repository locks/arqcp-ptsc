; Enunciado:
;
; A13:	Fa�a uma rotina que fa�a a convers�o Celsius/Fahrenheit.
;	Na pilha, os par�metros de entrada e de sa�da s�o os apresentados na indica��o feita para refer�ncia � rotina.
;	celsiusFahrenheit(n1 -- n2)
;
;	A regra de convers�o ser�:
;		C = 5/9*(F-32)
;

.file "ex_a_13.s"
.include "../lib/biblioteca.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
	br inicio

celsiusFahrenheit::			;  (n1 -- n2)
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

inicio::
	push.l #50
	call celsiusFahrenheit

	halt
.end