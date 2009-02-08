; Enunciado:
;
; D6:	Faça uma rotina que detecte se uma string colocada em memória está contida numa outra string também em memória.
;	Caso não esteja deverá deixar -1 no topo da stack;
 caso esteja deverá deixar a posição de memória onde se inicia.
;	Procura(end_s1 end_s2 -- nIndex)
;

.file "exd6.s"

.include "auxil.s"      		; definições auxiliares
.include "biblioteca.s"			; biblioteca de funções

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio

		str1:: .byte "osdolagh",0
		str2:: .byte "ola",0



Procura::
		
		pop lstack
		pop lstack
		

	sl_ciclo6::
		push r1
		ld.b []
		push r0
		push
		pop g0
		ld.b []
		xor
		call Iguais
		bz fim_sl_ciclo6:
		sl_ciclo5::
			


		br sl_ciclo6

		
	fim_sl_ciclo6::
	
	

		call Iguais
		
		


		ret

	
inicio::
		push.l #str1
		push.l #str2

		call Procura

        	halt
       		.end