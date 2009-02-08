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
.include  "auxil.s"      
.include "mylib.s"					; definições auxiliares
.org 0x1000        			; programa inicia-se no byte 0x1000
	br inicio


celsiusFahrenheit::			;  (n1 -- n2)
	sub
	rev
	call mymuls
	xcg
	call mydivu
	ret


inicio::
	push.n #5
	push.b #9
	push.l #50
	push.l #32

	call celsiusFahrenheit

	halt
	.end