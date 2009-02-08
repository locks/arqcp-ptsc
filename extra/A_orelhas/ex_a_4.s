; Enunciado:
;
; A4:	Faça uma rotina que calcule o resultado da operação 3*2
;

.file "ex_a_4.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
       	br inicio
.include  "auxil.s"      		; definições auxiliares

ex_a_4::				; 3*2 -> 3 2 *

push.l #3
push.l #2
pop g0
push.l #0 				;xcg
mulu 					;multiplica o g0 com o s1

ret

inicio::
		call ex_a_4
pop
		halt
		.end