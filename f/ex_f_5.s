; Enunciado:
;
; F5:	Dado um vector de números de 32 bits, e sabendo o seu tamanho, faça uma rotina que determine o maior dos seus elementos.
; 	Maior_V ( ender len_v -- maior )
;

.file "ex_f_5.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

vector:: .long 12,23,2,0,23,45

Maior_V::
ret

inicio::
	call Maior_V

	halt
.end
