; Enunciado:
;
; D5:	Faça uma rotina que permita detectar se duas strings colocadas em memória são iguais.
;	Caso sejam deverá deixar -1 no topo da stack; caso não sejam deverá deixar 0 (zero).
;	Iguais(end_s1 end_s2 -- n1)
;

.file "ex_d_5.s"

.include "auxil.s"      		; definições auxiliares

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio

str1::	.byte	"ola mundo",0
str2:	.byte	"ola mundo",0


Iguais::
		pop lstack
		pop lstack
	
loop_i::
		push r0
		ld.b []
		push r1
		ld.b []
		sub
		
		bz ciguais
		
		
niguais::
		push lstack
		pop
		push lstack
		pop
		push.n #0
ret

ciguais::
		push r1
		ld.b []
		bz fim_string
		push r0 
		inc #1
		pop r0
		push r1
		inc #1
		pop r1
		br loop_i

fim_string::
		push lstack
		pop
		push lstack
		pop
		push.n #-1
ret
		
	
inicio::
	push #str1
	push #str2

	call Iguais

	halt
.end