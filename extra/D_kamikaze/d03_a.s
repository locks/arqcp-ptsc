; Enunciado:
;
; D3:	Tendo duas strings em memória, terminando cada uma delas com o valor 0 (zero), faça uma rotina que as junte numa só que termina também com o valor 0 (zero).
;	No programa principal determine ainda a sua dimensão.
;	Junta(end_s1 end_s2 end_s3 -- );

.file "ex_d_3.s"

.include "auxil.s"      		; definições auxiliares

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio

.include "biblioteca1.s"			; biblioteca de funções
str1::	.byte	"ola",0
str2:	.byte	" mundo!",0
str3:	.space.b 25

Junta::

		pop lstack
		pop lstack
		pop lstack
		
		ciclo1::
			push r0
			ld.b []
			bz fim_str1
			push r0
			ld.b []
			push r2
			call escrb
			push r0
			inc #1
			pop r0
			push r2
			inc #1
			pop r2
			br ciclo1
fim_str1::
		push r1
		ld.b []
		push
		push r2
		call escrb
		bz fim
		push r2
		inc #1
		pop r2
		push r1
		inc #1
		pop r1
		br fim_str1
fim:: 
	push lstack
	push lstack	
	push lstack
	pop
	pop
	pop
	ret
	
inicio::	
		push #str1
		push #str2
		push #str3

		

		call Junta

        	halt
       		.end