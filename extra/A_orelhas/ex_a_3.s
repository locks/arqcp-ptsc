; Enunciado:
;
; A3:	Faça uma rotina que calcule o resultado da operação (3+2)-(3-5)
;

.file "ex_a_3.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
       	br inicio
.include  "auxil.s"      		; definições auxiliares

ex_a_3::			; (3+2)-(3-5) -> 3 2 + 3 5 - -

sub
rev ; puxa o ultimo para cima
rev 
add
xcg ; troca os dois primeiros
sub


		ret

inicio::
push.l #3
push.l #2
push.l #3
push.l #5
		call ex_a_3
pop
		halt
		.end