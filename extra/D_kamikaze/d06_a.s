; Enunciado:
;
; D6:	Fa�a uma rotina que detecte se uma string colocada em mem�ria est� contida numa outra string tamb�m em mem�ria.
;	Caso n�o esteja dever� deixar -1 no topo da stack; caso esteja dever� deixar a posi��o de mem�ria onde se inicia.
;	Procura(end_s1 end_s2 -- nIndex)
;

.file "ex_d_6.s"

.include "auxil.s"      		; defini��es auxiliares

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio

str1::	.byte	"ola mundo",0
str2:	.byte	"und",0
nindex:	.long	0
Procura::
		pop lstack
		pop lstack		
		push.n #0
		pop lstack  	;ponto inicio str1;r2
		push.n #0
		pop lstack	;onde estamos str1;r1
		push.n #0
		pop lstack	;onde estamos str2;r0				
		push r3		;ponto de partida
		pop r2		;igual a inicio de r1
ciclo1::
		push r2
		pop r1
		push r4
		pop r0
ciclo2::		
		push r0
		ld.b []
		bz encontramos
		push r1
		ld.b []
		bz fim_str1
		push r0
		ld.b []
		push r1
		ld.b []
		sub
		bz seguintes
		push r2
		inc #1
		pop r2
		br ciclo1
				
seguintes::
		push r0
		inc #1
		pop r0
		push r1
		inc #1
		pop r1
		br ciclo2
encontramos::  
		push r2 

		push lstack
		pop
		push lstack 
		pop
		push lstack 
		pop
		push lstack
		pop
		push lstack
		pop
		
		ret
fim_str1::
		push lstack
		pop
		push lstack 
		pop
		push lstack 
		pop
		push lstack
		pop
		push lstack
		pop
		push.n #-1
		ret
		
	
inicio::

		push #str1
		push #str2

		call Procura

        	halt
       		.end