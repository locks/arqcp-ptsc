; Enunciado:
;
; D3:	Tendo duas strings em mem�ria, terminando cada uma delas com o valor 0 (zero), fa�a uma rotina que as junte numa s� que termina tamb�m com o valor 0 (zero).
;	No programa principal determine ainda a sua dimens�o.
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