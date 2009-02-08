.file "ex_teste_3.s"

.include "auxil.s"      		; definições auxiliares

.org 0x1000        			; programa inicia-se no byte 512 = 0x200

        br inicio

.include "Biblioteca.s"			; biblioteca de funções

;Desenvolva a rotina difhora(seg1 min1 hor1 seg2 min2 hor2 -- seg3 min3 hor3)
;que dado duas horas (expressas em horas, minutos e segundos)
;calcula a diferença entre duas horas do mesmo dia (expressos em horas, minutos e segundos).

difhora:: 			;(seg1 min1 hor1 seg2 min2 hor2 -- seg3 min3 hor3)

	push #3600		;(seg1, min1, hor1, seg2, min2, hor2,  3600)
	call mymulu		;(seg1, min1, hor1, seg2, min2, hseg2, 0)	;mymulu ( n1 n2 -- n3_low n3_high )
	pop				;(seg1, min1, hor1, seg2, min2, hseg2)
	xcg				;(seg1, min1, hor1, seg2, hseg2, min2)
	push #60		;(seg1, min1, hor1, seg2, hseg2, min2, 60)
	call mymulu		;(seg1, min1, hor1, seg2, hseg2, mseg2, 0) 	;mymulu ( n1 n2 -- n3_low n3_high )
	pop				;(seg1, min1, hor1, seg2, hseg2, mseg2) 
	add				;(seg1, min1, hor1, seg2, temp2) 
	add				;(seg1, min1, hor1, temp2) 
	pop lstack		;(seg1, min1, hor1)  L(temp2)
	
	;A mesma cena para o tempo 1, reduzir a segundos ...

	push #3600		
	call mymulu		
	pop				
	xcg				
	push #60		
	call mymulu		
	pop				
	add				
	add				;(temp1)
	
	push lstack		;(temp1, temp2)
	xcg				;(temp2, temp1)	
	sub				;(temp3) ;sub ( n1 n2 -- n3 ) Subtrai n2 a n1 Atenção: O tempo 2 tem que ser maior que tempo 1.
	
	push #0			;(temp3 , 0)
	push #3600		;(temp3 , 0, 3600)
	call mydivu		;(horas3, resto) 				;mydivu( n1_low n1_high n2 -- quociente resto )
	push #0			;(horas3, resto, 0) 
	push #60		;(horas3, resto, 0, 60) 
	call mydivu		;(horas3, minutos3, segundos3, 0)  	;mydivu( n1_low n1_high n2 -- quociente resto )
	pop 			;(horas3, minutos3, segundos3)
	xcg				;(horas3, segundos3, minutos3)
	rev				;(segundos3, minutos3, horas3)
	
	ret

	
inicio:: 
	
	push #43  ;segundos1
	push #25  ;minutos1
	push #7	  ;horas1
	
	push #52  ;segundos2
	push #16  ;minutos2
	push #15  ;horas2	

	call difhora

        halt
       	.end