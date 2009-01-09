; Enunciado:
;
; D1:	Tendo uma string armazenada em memória que termina com o valor 0 (zero), faça uma rotina que calcule a dimensão dessa string.
;	tamString(end_string -- tamanho)
;

.file "ex_d_1.s"
.include "auxil.s"
.include "biblioteca.s"

.org 0x1000
	br inicio

tamString::

ret

inicio::
	call tamString

	halt
.end