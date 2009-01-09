; Enunciado:
;
; B10:	Faça uma rotina que guarde no byte com endereço n3, o resultado da seguinte expressão:
	[n3] = [n1]%[n2] (conteúdo do endereço n3 = conteúdo do endereço n1 % conteúdo do endereço n2).
;

.file "ex_b_10.s"


.org 0x1000        				; programa inicia-se no byte 0x1000
       	br inicio
.include "auxil.s"      		; definições auxiliares
.include "write_byte_word.s"		; biblioteca de funções de escrita de byte e word em memória

n1::	.long	0xA3CF992B
n2:	.word	231
n3:	.word	0



F10::					; F10(n1 n2 n3 -- ): [n3]=[n1]%[n2]

		completar

		ret

	
inicio::
		completar

		call F10

        	halt
       		.end
