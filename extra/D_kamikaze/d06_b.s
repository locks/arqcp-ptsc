; Enunciado:
;
; D6:	Fa�a uma rotina que detecte se uma string colocada em mem�ria est� contida numa outra string tamb�m em mem�ria.
;	Caso n�o esteja dever� deixar -1 no topo da stack; caso esteja dever� deixar a posi��o de mem�ria onde se inicia.
;	Procura(end_s1 end_s2 -- nIndex)
;

.file "ex_d_6.s"
.include "ex_d_5.s"			; exerc�cio anterior
.include "auxil.s"      		; defini��es auxiliares
.include "biblioteca.s"			; biblioteca de fun��es
.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio

st1: .byte "alveolidades",0
st2: .byte "idade",0

Procura::
		push
		pop g0
		iguais::
		
		

		ret

inicio::
		push.l #st1
		push.l #st2


		call Procura

        	halt
       		.end