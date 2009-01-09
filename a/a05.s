; Enunciado:
;
; A5: 	Faça uma rotina que possa utilizar num programa para efectuar a multiplicação de dois operandos:
;	mymulu, para números sem sinal
;	mymuls, para números com sinal
;

.file "ex_a_5.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
       	br inicio
.include  "auxil.s"      		; definições auxiliares

mymulu::				;  ( n1 n2 -- n3_low n3_high )

					; não esquecer de guardar g0



					; não esquecer de repor g0
          	ret


mymuls::				;  ( n4 n5 – n6_low n6_high )
					; mulus é diferente de mulu apenas na forma como trata os valores 0xf0000000-0xf1111111,
					; pois trata-os como negativos
					; daí que a rotina seja exactamente igual à axcepção dessa instrução 

					; não esquecer de guardar g0



					; não esquecer de repor g0
          	ret
