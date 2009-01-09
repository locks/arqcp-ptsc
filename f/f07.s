; Enunciado:
;
; F7:	Dado um vector de bytes, e sabendo o seu tamanho, faça uma rotina que determine a média dos elementos desse vector.
; 	Media_V ( ender len_v -- media )
;

.file "ex_f_7.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

vector:: .long 12,23,2,0,23,45

Media_V::
ret

inicio::
	call Media_V

	halt
.end
