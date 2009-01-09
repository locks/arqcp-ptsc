; Enunciado:
;
; A10:	Faça uma rotina que possa utilizar num programa para efectuar a divisão de dois operados.
;	mydivu, para números sem sinal
;

.file "ex_a_10.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
	br inicio
.include  "auxil.s"      		; definições auxiliares

mydivu::				;  ( n1 n2 -- n3_quociente n4_resto )

					; não esquecer de guardar g0


					; não esquecer de repor g0
ret
