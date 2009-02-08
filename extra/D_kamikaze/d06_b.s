; Enunciado:
;
; D6:	Faça uma rotina que detecte se uma string colocada em memória está contida numa outra string também em memória.
;	Caso não esteja deverá deixar -1 no topo da stack; caso esteja deverá deixar a posição de memória onde se inicia.
;	Procura(end_s1 end_s2 -- nIndex)
;

.file "ex_d_6.s"
.include "ex_d_5.s"			; exercício anterior
.include "auxil.s"      		; definições auxiliares
.include "biblioteca.s"			; biblioteca de funções
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