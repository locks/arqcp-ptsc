; Enunciado:
;
; A5: 	Fa�a uma rotina que possa utilizar num programa para efectuar a multiplica��o de dois operandos:
;	mymulu, para n�meros sem sinal
;	mymuls, para n�meros com sinal
;

.file "ex_a_5.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
       	br inicio
.include  "auxil.s"      		; defini��es auxiliares

mymulu::				;  ( n1 n2 -- n3_low n3_high )

					; n�o esquecer de guardar g0



					; n�o esquecer de repor g0
          	ret


mymuls::				;  ( n4 n5 � n6_low n6_high )
					; mulus � diferente de mulu apenas na forma como trata os valores 0xf0000000-0xf1111111,
					; pois trata-os como negativos
					; da� que a rotina seja exactamente igual � axcep��o dessa instru��o 

					; n�o esquecer de guardar g0



					; n�o esquecer de repor g0
          	ret
