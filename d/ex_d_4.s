; Enunciado:
;
; D4:	Tendo uma string em mem�ria que termina com o valor 0 (zero),
;	fa�a uma rotina que a divida em duas a partir da posi��o pretendida.
;	No programa principal determine ainda a dimens�o de cada uma delas.
; 	Separa(end_s1 end_s2 nIndex -- )
;

.file "ex_d_4.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

Separa::
ret

inicio::
	call Separa

	halt
.end