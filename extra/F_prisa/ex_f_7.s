; Enunciado:
;
; F7:	Dado um vector de bytes, e sabendo o seu tamanho, faça uma rotina que determine a média dos elementos desse vector.
; 	Media_V ( ender len_v -- media )
;

.file "ex_f_7.s"

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio

.include "auxil.s"      		; definições auxiliares
.include "Biblioteca1.s"			; biblioteca de funções

vector:: .long 12,23,2,0,23,45
lenv:: .long 6



Media_V::
			push ct
			pop
			push
			pop lstack
			pop ct
			pop lstack
			
			
			push #0
			pop lstack
	
			ciclo::
				push r1		
				ld []
				push r0
				add
				pop r0
				push r1
				inc #4
				pop r1		
				dbr ciclo	
				push lstack
				push lstack
				pop	
		;Faz a divisão da soma dos elementos pelo numero de elementos
		push.n #0
		push r0
			
		call mydivu
		push lstack
		pop	
		
		ret
			
	
inicio::

		
	push.l #vector
	push.l #lenv
	ld[]
		call Media_V

        	halt
       		.end
