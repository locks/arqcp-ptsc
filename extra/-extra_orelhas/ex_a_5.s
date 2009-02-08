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
		push g0
		pop lstack		; n�o esquecer de guardar g0
		pop g0
		push.n #0
		mulu
		pop			
		push lstack
		pop g0
					; n�o esquecer de repor g0
          	ret


mymuls::				
		push g0
		pop lstack	 			
		pop g0			
		push.n #0		
		muls		
		pop 
		push lstack
		pop g0
					
          	ret
inicio::
	push.n #3
	push.n #2
	call mymulu
	push.n #-3
	push.n #-2
	call mymuls
	
	halt
	.end