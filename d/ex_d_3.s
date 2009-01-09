; Enunciado:
;
; D3:	Tendo duas strings em memória, terminando cada uma delas com o valor 0 (zero), faça uma rotina que as junte numa só que termina também com o valor 0 (zero).
;	No programa principal determine ainda a sua dimensão.
;	Junta(end_s1 end_s2 end_s3 -- );

.file "ex_d_3.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

Junta::
ret

inicio::
	call Junta

	halt
.end