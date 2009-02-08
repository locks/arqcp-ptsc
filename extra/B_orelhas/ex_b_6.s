; Enunciado:
;
; B5:	Faça uma rotina que escreva uma word na memória.
;	Tome em atenção que não pode alterar as posições de memória contíguas.
;	Na pilha, os parâmetros de entrada e de saída são os apresentados na indicação feita para referência à rotina:
;	ESCRW( word ender -- )
;

.file "ex_b_6.s"


.org 0x1000        				; programa inicia-se no byte 0x1000
       	br inicio
.include "auxil.s"      		; definições auxiliares
.include "biblioteca.s"			; biblioteca de funções

escrw::					;escrw (word addr -- )
					;desc:	escreve um word na memória 
					;input:
					;	word: a word a guardar
					;	addr: o endereço a guardar a word


	completar

	ret
