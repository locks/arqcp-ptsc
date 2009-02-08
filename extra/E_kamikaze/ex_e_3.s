; Enunciado:
;
; E3:	Desenvolva uma fun��o, que permita ler uma string do teclado, sabendo que o terminar dessa introdu��o � reconhecido pelo ASCII [CR] � Carriage return.
;	O seu armazenamento deve ser feito em mem�ria, terminando com o valor 0 (zero), e de seguida se guarde em mem�ria tamb�m o seu tamanho. 
;	inString( endS -- )
;

.file "ex_e_3.s"

.org 0x1000
        br inicio
.include "auxil.s"      		; defini��es auxiliares
.include "biblioteca1.s"
str1::	.space.b 50
inString::
		pop lstack
		
ciclo::	
		key
		push
		push.b #13
		sub
		bz fim
		push r0
		call escrb
		push r0
		inc#1
		pop r0
		br ciclo
		
fim::
	pop
	push.n #0
	push lstack
	call escrb


	ret
	
inicio::
	push #str1
	call inString
	
	halt
	.end	