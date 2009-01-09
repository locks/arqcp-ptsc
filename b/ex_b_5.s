; Enunciado:
;
; B5:	Faça uma rotina que escreva um byte na memória.
;	Tome em atenção que não pode alterar as posições de memória contíguas.
;	Na pilha, os parâmetros de entrada e de saída são os apresentados na indicação feita para referência à rotina:
;	ESCRB( byte ender -- )
;

.file "ex_b_5.s"
.include "auxil.s"
.include "biblioteca.s"

.org 0x1000
	br inicio

escrb::			;escrb (byte addr -- )
					;desc:	escreve um byte na memória 
					;input:
					;	byte: o byte a guardar
					;	addr: o endereço a guardar o byte
ret	
