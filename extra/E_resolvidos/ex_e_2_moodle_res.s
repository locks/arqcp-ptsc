; Enunciado:
;
; E2:	Desenvolva uma rotina que permita escrever um caracter [ASCII] no monitor, estando esse caracter no topo da stack. 
;	outCaracter( c -- )
;

.file "ex_e_2_moodle_res.s"

.include "auxil.s"      		; definições auxiliares

.org 0x1000        			; programa inicia-se no byte 4096 = 0x1000

        br inicio

outCaracter::					;(c --)
	emit
	ret
	
inicio::	
	push.l #97				;colocar o código ascii do char 'a' em decimal
	;push #0x61					;colocar o código ascii do char 'a' em hexadecimal

	call outCaracter
	halt
	.end