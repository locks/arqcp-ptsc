; Enunciado:
;
; A13:	Faça uma rotina que faça a conversão Celsius/Fahrenheit.
;	Na pilha, os parâmetros de entrada e de saída são os apresentados na indicação feita para referência à rotina.
;	celsiusFahrenheit(n1 -- n2)
;
;	A regra de conversão será:
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