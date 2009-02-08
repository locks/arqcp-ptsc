; Enunciado:
;
; D2:	Fa�a uma rotina que copie uma string colocada em mem�ria para outra posi��o de mem�ria.
;	Parta do princ�pio que a s2 t�m pelo menos o mesmo tamanho que a s1.
;	Copia(end_s1 end_s2 -- )
;

.file "ex_d_2.s"

.include "auxil.s"      		; defini��es auxiliares

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio

.include "biblioteca1.s"			; biblioteca de fun��es
str1::	.byte	"ola",0
str2:	.space.b 3
Copia::		
		dec #1
		push #0
		pop lstack
		pop lstack
		pop lstack
		pop lstack
		copia_loop::
				push r2
				bz fim1
				push r0
				ld.b []
				push
				bz fim2
				push r1
				call escrb
				push r0
				inc #1
				pop r0
				push r1
				inc #1
				pop r1				
				push r3
				inc #1
				pop r3					
				push r2
				dec #1
				pop r2
				br copia_loop
		fim1::
			push #0
			
		fim2::
			push r1
			call escrb
			push lstack
			push lstack
			push lstack
			pop
			pop
			pop
			push lstack	
			
		ret

	
inicio::

		push #str1
		push #str2
		push #4
		 

		call Copia

        	halt
       		.end