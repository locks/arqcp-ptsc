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
.include  "auxil.s"      
.include "mylib.s"					; defini��es auxiliares
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