; Enunciado:
;
; D1:	Tendo uma string armazenada em memória que termina com o valor 0 (zero), faça uma rotina que calcule a dimensão dessa string.
;	tamString(end_string -- tamanho)
;

.file "ex_d_1.s"

.include "auxil.s"      		; definições auxiliares

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio

;.include "biblioteca.s"			; biblioteca de funções

STRING:: .byte "AABAARQCA",0

tamString::
	pop lstack
	pop lstack
	push.l #0
	SL_LOOP::
		push r0
		ld.b []
		push
		bz SL_FIM
		push lstack
		inc #1
		pop lstack
		push r1
		xor
		bz SL_CONT
		br SL_LOOP
		
	SL_CONT::
		inc #1
		br SL_LOOP

	SL_FIM::
		pop
		ret

	
inicio::

		push.l #STRING
		push.l #'A'
		call tamString

        	halt
       		.end