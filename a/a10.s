; Enunciado:
;
; A10:	Fa�a uma rotina que possa utilizar num programa para efectuar a divis�o de dois operados.
;	mydivu, para n�meros sem sinal
;

.file "ex_a_10.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
	br inicio
.include  "auxil.s"      		; defini��es auxiliares

mydivu::				;  ( n1 n2 -- n3_quociente n4_resto )

					; n�o esquecer de guardar g0


					; n�o esquecer de repor g0
ret
